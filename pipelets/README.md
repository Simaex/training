# Pipelets

## What is a Pipelet?
Pipelets are plugins to the Squirro pipeline, used to customize how data is processed.
### Where do pipelets fit in the process of loading data?
Pipelets are used to modify data once it has been transformed into the Squirro item format. The Squirro item format is a consistent and predictable format that all data is changed into before being loaded into Squirro. The step of taking source data (like what is produced by Data Loader plugins) and turning it into the Squirro item format is done automatically by the Squirro Data Loader tool.

![alt text](https://docs.google.com/drawings/d/1QZnJN9j4B_MG8X98DLnkXagVF53S10EMiR34wcBH-wQ/pub?w=1258&amp;h=598 "Data Flow Diagram")

For this reason, you should always design pipelets to work with data that exists in the Squirro item format shown below.
##### Where can you run pipelets?
As illustrated below, pipelets can be run either by the Squirro server as part of the standard pipeline whenever data is uploaded, or can be run by the Data Loader before data is uploaded to the Squirro server.
In these diagrams, the red arrow indicates the flow of data through the system.
###### Running within the data loader
![alt text](https://docs.google.com/drawings/d/1dEiDytuAPpK4zgNjNt0a6W2iptZBDzqWinTfRWuuAys/pub?w=1258&amp;h=598 "Data Flow Diagram")
###### Running server-side within the standard pipeline
![alt text](https://docs.google.com/drawings/d/1ZBQE_9YCSkkPVSNo7Z1IrjUF3dmjLzrklKQpl1ga7JE/pub?w=1200&amp;h=462 "Data Flow Diagram")
#### The Squirro item format
Once transformed by the data loader, Squirro items will always have the same structure. For example, one item could look like this:
```json
{
    "id": "1234567",
    "title": "Squirro",
    "body": "The Insights Company...",
    "link": "http://www.squirro.com",
    "language": "en",
    "created_at": "2012-07-13T00:00:00",
    "keywords": {
        "offices": ["Zürich", "New York", "Munich", "London", "Barcelona"],
        "technology": ["Search", "NLP", "Analytics", "Unstructured Data"]
    },
    "summary": "Actionalbe insights for your business",
}
```
A few things to note about the Squirro item format
* Any metadata can be stored within the top-level `keywords` key. As shown above, the metadata is always stored as a list of values, where each value can be a string, integer, floating point number, or datetime.
* The keys shown above are the __only__ keys that should ever be present in the top level of the JSON object. __Every__ other piece of metadata included within the item should be stored as a facet nested within `keywords`
### What do Pipelets look like?
Pipelets are implemented as Python classes which inherit from the PipeletV1 base class. When you create a pipelet, you only have one method to implement, which is `consume()`
In general, Pipelets will look like this:
```python
"""
This is an Example Pipelet
"""

from squirro.sdk import PipeletV1, require

@require('log')
class ExamplePipelet(PipeletV1):

    def __init__(self, config):

        self.config = config

    def consume(self, item):

        # Enrichment code goes here...
        return item

```
