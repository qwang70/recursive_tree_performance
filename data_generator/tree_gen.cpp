#include <iostream>
#include <cstdlib>
#include <fstream>
#include <string>

using namespace std;

int main(int argc, char **argv) {
    
    string fn1 = "level_info/level"+string(argv[1])+".csv";
    ofstream myfile1;
    myfile1.open (fn1, ios::out);
    
    string fn2 = "level_info/level"+string(argv[1])+".P";
    ofstream myfile2;
    myfile2.open (fn2, ios::out);
    
    if (myfile1.is_open() && myfile2.is_open())
    {

        int level = atol(argv[1]);
        myfile1<<"child_data_id,parent_data_id\n";
        myfile2<<"% FACT: tree_edge(child, parent)\n";
        for(long i = 1; i < 1<<(level-1); i++){
            myfile1<<2*i<<","<<i<<'\n';
            myfile1<<2*i+1<<","<<i<<'\n';
            
            myfile2<<"tree_edge("<<2*i<<","<<i<<").\n";
            myfile2<<"tree_edge("<<2*i+1<<","<<i<<").\n";
        }
        myfile1.close();
        myfile2.close();
    }
    else cout << "Unable to open file";
    return 0;
}