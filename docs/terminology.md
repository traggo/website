# Terminology

## User

A user owns multiple [Tagged](#tags) [TimeSpans](#timespan), [Dashboards](#dashboard) and [Devices](#device).
Admin-Users can manage other [Users](#user) but they have no access to [TimeSpans](#timespan), [Tags](#tag) 
and [Dashboards](#dashboard) from others.

!!! warning
    Server owners which have direct access to the database are able to read everything from all users.
   
## Device

A device will be created when a [User](#user) login with username/password. 
Each device may access the the users data like [TimeSpans](#timespan). 
Devices can be managed only by the [User](#user) who created them.

## TimeSpan

A timespan has a start and end date. Each timespan can have multiple [Tags](#tag).
Time spans can be managed only by the [User](#user) who created them.

## Tag

A tag has a key and a value. Tags normally have a format like this `key:value` (example: `type:cooking`).

## Dashboard

A dashboard contains multiple [Dashboard Entries](#dashboard-entry) and [Dashboard Ranges](#dashboard-range).
Dashboards can be managed only by the [User](#user) who created them.

## Dashboard Entry

A dashboard entry is part of a [Dashboard](#dashboard). It displays a configurable diagram of aggregated 
[TimeSpans](#timespan) with specific [Tags](#tag), a specific date-range and interval.
This date range could be unique and only be used on one entry or the entry could use a 
configured [Dashboard Range](#dashboard-range). The interval determines on what intervals the data should be aggregated.
F.ex. `daily` would include the 24 hours of a day.

Currently, the following diagram types are supported:

* bar chart
* stacked bar chart
* pie chart
* line chart

## Dashboard Range

A dashboard range is a [Static Range](#static-range) or a [Relative Range](#relative-range) which can be used for multiple 
[Dashboard Entries](#dashboard-entry).

## Static Range

A static range has a concrete start and end point. Like f.ex. 10/12/1998 5:12 PM to 10/13/1998 5:12 PM.

Dates must be in this format to work: `2023-01-01T00:00:00.000Z`

(This currently only works in editable time field, they can be made static afterwards to hide them on the dashboard)

## Relative Range

A relative range is relative to now. You can use simple operations to subtract time from it.

### Examples

| Relative Range            | From        | To |
| ---                       | ---         | --- |
| Last 10 minutes           | now-10m     | now |
| This week                 | now/w       | now/w |
| Last week                 | now-1w/w    | now-1w/w |
| Last month                | now-1M/M    | now-1M/M |
| Last weekend              | now-1w/w+5d | now-1w/w |
| Last week monday - friday | now-1w/w    | now-1w/w-2d |

### Units

| Shorthand | Full      |
| --------- | --------- |
| s         | second    |
| m         | minute    |
| h         | hour      |
| d         | day       |
| w         | week      |
| M         | month     |
| y         | year      |

### Operations

| Opertaion | Description |
| --------- | ----------- |
| `+` | add X Unit|
| `-` | subtract X Unit |
| `/` | start of / end of Unit |
