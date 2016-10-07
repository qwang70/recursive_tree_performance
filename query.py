import time
import sqlite3

elapse_reduce = []
elapse_all = []

def data_downstream_reduced():
    #level = "level"+str(i)
    cursor.execute("DROP TABLE IF EXISTS data_downstream_reduced;")
    view = """CREATE TABLE data_downstream_reduced AS
        WITH RECURSIVE data_down(x,y) AS
        (SELECT child_data_id, parent_data_id
        FROM level20 WHERE parent_data_id = 1
        UNION ALL
        SELECT child_data_id, data_down.y
        FROM data_down, level20
        ON data_down.x = parent_data_id
        WHERE data_down.x != data_down.y)
        SELECT x AS descendent_data_id, y AS ancestor_data_id FROM data_down;
        """
    start = time.time()
    #cursor.execute(view, {"Level": level})
    cursor.execute(view)
    end = time.time()
    elapse_reduce.append(end-start)
    results = cursor.fetchall()
    for r in results:
        print r[0]

def data_downstream():
    #level = "level"+str(i)
    cursor.execute("DROP TABLE IF EXISTS data_downstream;")
    start = time.time()
    view = """
        CREATE TABLE data_downstream AS
        WITH RECURSIVE data_down(x,y) AS
        (SELECT child_data_id, parent_data_id
        FROM level20
        UNION ALL
        SELECT child_data_id, data_down.y
        FROM data_down, level20
        ON data_down.x = parent_data_id
        WHERE data_down.x != data_down.y)
        SELECT x AS descendent_data_id, y AS ancestor_data_id FROM data_down;
        """
    start = time.time()
    #cursor.execute(view, {"Level": level})
    cursor.execute(view)
    end = time.time()
    elapse_all.append(end-start)
    results = cursor.fetchall()
    for r in results:
        print r[0]


if __name__ == '__main__':
    connection = sqlite3.connect('recursive.db')
    cursor = connection.cursor()
    data_downstream_reduced()
    cursor.close()
    connection.close()
    
    connection = sqlite3.connect('recursive.db')
    cursor = connection.cursor()
    data_downstream()
    cursor.close()

    print elapse_reduce
    print elapse_all

    cursor.close()
    connection.close()
