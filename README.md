# recursive_tree_performance

## Background

The [YesWorkflow project](https://github.com/yesworkflow-org/yw-prototypes/tree/log-file-parsing) enables scientists to annotate existing code scripts with special YW comments and visualizes the computational modules and dataflows. YesWorkflow originally uses XSB to compute all the relationship between modules and dataflow with recursive query. With SQLite recursive query, we can also do the same job. This raises an interesting question: this XSB performs better than SQLite in recursive query? When the input data is huge, does sqlite runs faster than XSB? 

## Recursive tree performance experiment

In this experiment, we created a dataset of full binary tree. The data shows the edges of each tree, and the data contains tree of levels from 2 to 20, meaning there're tree with number of nodes from 2^2-1 to 2^20-1.
