# Association Field

A Symphony field to link entries between two sections.

## Usage

- Works in a near identical way to the standard select box field, however there is no static options and entries are linked internally via their ID, meaning that if an entry is changed, any Association fields will not lose their link to that entry.

- Setting an instance of the field to be not required will cause an empty option to show up on the publish form.

## Filtering options

The Association Field supports the following filtering options in your data sources:

- `Red Cats` or `not: Red Cats`: Return all entries where the linked entry has the value of `Red Cats` (or does not have the value `Red Cats`)
- `red-cats` or `not: red-cats`: Return all entries where the linked entry has the handle of `red-cats` (or does not have the handle `red-cats`)
- `1` or `not: 1`: Return all entries where the linked entry ID is `1`, (or is not `1`)
- `sql-null-or-not: 1`: Return all entries where the linked entry ID is not 1 or the entry has no linked entries.
- `sql: NULL`: Return all entries that do not have any linked entries
- `sql: NOT NULL`: Return all entries that have a linked entry

Please note that predicate filters, such as `not:` or `sql:`, will ignore all other [data source filters](http://getsymphony.com/learn/concepts/view/data-source-filters/) for that field.
