# recursive_tree_performance

## Background

The [YesWorkflow project](https://github.com/yesworkflow-org/yw-prototypes/tree/log-file-parsing) enables scientists to annotate existing code scripts with special YW comments and visualizes the computational modules and dataflows. YesWorkflow originally uses XSB to compute all the relationship between modules and dataflow with recursive query. With SQLite recursive query, we can also do the same job. This raises an interesting question: this XSB performs better than SQLite in recursive query? When the input data is huge, does sqlite runs faster than XSB? 

## Recursive tree performance experiment
