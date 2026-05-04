# Bluestone PIM Attribute Types

All 16 attribute types and their JSON representation in the Public API (PAPI) product response. Each attribute on a product appears in the `attributes` array.

## Common attribute fields

Every attribute has these fields:

| Field | Description |
|-------|-------------|
| `id` | Attribute definition GUID |
| `name` | Display name |
| `number` | Machine identifier (use for external mapping) |
| `groupName` | Attribute group display name |
| `groupNumber` | Attribute group identifier |
| `dataType` | One of the types below |
| `values` | Array of string values (for simple types) |
| `select` | Array of select options (for single/multi select) |
| `dictionary` | Array of dictionary options |
| `column` | Array of column cells |
| `matrix` | Array of matrix columns with rows |
| `unit` | Unit of measurement (nullable) |
| `valueType` | Sub-type (nullable) |
| `definingAttribute` | Whether this is a variant-defining attribute (nullable) |

## Boolean

**dataType**: `boolean`

```json
{
  "id": "60869a7c6b2f07000cacff73",
  "name": "Boolean attribute example",
  "number": "boolean-attribute-example-code",
  "groupName": "Attribute group example",
  "dataType": "boolean",
  "values": ["true"],
  "select": [],
  "dictionary": [],
  "column": [],
  "matrix": [],
  "unit": null,
  "groupNumber": "attribute_group_example",
  "valueType": null,
  "definingAttribute": null
}
```

## Text

**dataType**: `text`

```json
{
  "id": "5da7254de21b84000c6ed075",
  "name": "Text attribute example",
  "number": "text-attribute-example-code",
  "groupName": "Attribute group example",
  "dataType": "text",
  "values": ["Example text"],
  "select": [],
  "dictionary": [],
  "column": [],
  "matrix": [],
  "unit": null,
  "groupNumber": "attribute_group_example",
  "valueType": null,
  "definingAttribute": null
}
```

## Multiline

**dataType**: `multiline`

```json
{
  "id": "60869b626b2f07000cacff7a",
  "name": "Multiline attribute example",
  "number": "multiline-attribute-example-code",
  "groupName": "Attribute group example",
  "dataType": "multiline",
  "values": ["This text has \nmultiple lines."],
  "select": [],
  "dictionary": [],
  "column": [],
  "matrix": [],
  "unit": null,
  "groupNumber": "attribute_group_example",
  "valueType": null,
  "definingAttribute": null
}
```

## Formatted Text (Markdown)

**dataType**: `formatted_text`, **contentType**: `text/markdown`

```json
{
  "id": "5e60fdf452faff000e4d0882",
  "name": "Markdown attribute example",
  "number": "markdown-attribute-example",
  "groupName": "Attribute group A",
  "dataType": "formatted_text",
  "contentType": "text/markdown",
  "values": ["# Header example\n\nExample with **bold** and _italic_.\n\n  \nIt also has a bullet list.\n\n- List item 1\n- List item 2"],
  "select": [],
  "dictionary": [],
  "column": [],
  "matrix": [],
  "unit": null,
  "groupNumber": "attribute_group_a",
  "valueType": null,
  "definingAttribute": null
}
```

## Formatted Text (HTML)

**dataType**: `formatted_text`, **contentType**: `text/html`

```json
{
  "id": "678a6a3344089a49f1ee6cff",
  "name": "HTML attribute example",
  "number": "html-attribute-example",
  "groupName": "Attribute group A",
  "dataType": "formatted_text",
  "contentType": "text/html",
  "values": ["<h2>Headline</h2><p>Body text</p>"],
  "select": [],
  "dictionary": [],
  "column": [],
  "matrix": [],
  "unit": null,
  "groupNumber": "attribute_group_a",
  "valueType": null,
  "definingAttribute": null
}
```

## Integer

**dataType**: `integer`

```json
{
  "id": "5e0dc0b5cff47e000cd5c9d1",
  "name": "Integer attribute example",
  "number": "integer-attribute-example-code",
  "groupName": "Attribute group example",
  "dataType": "integer",
  "values": ["42"],
  "select": [],
  "dictionary": [],
  "column": [],
  "matrix": [],
  "unit": null,
  "groupNumber": "attribute_group_example",
  "valueType": null,
  "definingAttribute": null
}
```

Note: Value is a string, not a number. Parse accordingly.

## Decimal

**dataType**: `decimal`

```json
{
  "id": "60869af452faff000cd1ab17",
  "name": "Decimal attribute example",
  "number": "decimal-attribute-example-code",
  "groupName": "Attribute group example",
  "dataType": "decimal",
  "values": ["198233.6875"],
  "select": [],
  "dictionary": [],
  "column": [],
  "matrix": [],
  "unit": null,
  "groupNumber": "attribute_group_example",
  "valueType": null,
  "definingAttribute": null
}
```

Note: Value is a string. Parse to appropriate decimal/float type.

## Date

**dataType**: `date`

```json
{
  "id": "5ed60e4952faff000f4b46cc",
  "name": "Date attribute example",
  "number": "date-attribute-example-code",
  "groupName": "Attribute group example",
  "dataType": "date",
  "values": ["2020-01-01"],
  "select": [],
  "dictionary": [],
  "column": [],
  "matrix": [],
  "unit": null,
  "groupNumber": "attribute_group_example",
  "valueType": null,
  "definingAttribute": null
}
```

## Date and Time

**dataType**: `date_time`

```json
{
  "id": "5ed60e57d60180000c280b5f",
  "name": "Datetime attribute example",
  "number": "datetime-attribute-example-code",
  "groupName": "Attribute group example",
  "dataType": "date_time",
  "values": ["2020-01-01 9:00:00"],
  "select": [],
  "dictionary": [],
  "column": [],
  "matrix": [],
  "unit": null,
  "groupNumber": "attribute_group_example",
  "valueType": null,
  "definingAttribute": null
}
```

## Time

**dataType**: `time`

```json
{
  "id": "60869a0d6b2f07000cacff72",
  "name": "Time attribute example",
  "number": "time-attribute-example-code",
  "groupName": "Attribute group example",
  "dataType": "time",
  "values": ["11:05:31"],
  "select": [],
  "dictionary": [],
  "column": [],
  "matrix": [],
  "unit": null,
  "groupNumber": "attribute_group_example",
  "valueType": null,
  "definingAttribute": null
}
```

## Regular Expression (Pattern)

**dataType**: `pattern`

```json
{
  "id": "60869b796b2f07000cacff7b",
  "name": "Regular Expression attribute example",
  "number": "regular-expression-attribute-example-code",
  "groupName": "Attribute group example",
  "dataType": "pattern",
  "values": ["Text that must match a regular expression."],
  "select": [],
  "dictionary": [],
  "column": [],
  "matrix": [],
  "unit": null,
  "groupNumber": "attribute_group_example",
  "valueType": null,
  "definingAttribute": null
}
```

## Single Select

**dataType**: `single_select`

Value appears in both `values` (display value) and `select` (with id, number, metadata).

```json
{
  "id": "5db038fcd60180000cf9851e",
  "name": "Single select attribute example",
  "number": "single-select-attribute-example-code",
  "groupName": "Attribute group example",
  "dataType": "single_select",
  "values": ["Value A"],
  "select": [
    {
      "id": "5db038fcd60180000cf9851c",
      "value": "Value A",
      "number": "value-a-code",
      "metadata": null
    }
  ],
  "dictionary": [],
  "column": [],
  "matrix": [],
  "unit": null,
  "groupNumber": "attribute_group_example",
  "valueType": null,
  "definingAttribute": null
}
```

## Multi Select

**dataType**: `multi_select`

Multiple values in both `values` and `select` arrays.

```json
{
  "id": "5db038d4590801000caa534e",
  "name": "Multi select attribute example",
  "number": "multi-select-attribute-example-code",
  "groupName": "Attribute group example",
  "dataType": "multi_select",
  "values": ["Value A", "Value B"],
  "select": [
    {
      "id": "5db038d4590801000caa534a",
      "value": "Value A",
      "number": "value-a-code",
      "metadata": null
    },
    {
      "id": "5db038d4590801000caa534b",
      "value": "Value B",
      "number": "value-b-code",
      "metadata": null
    }
  ],
  "dictionary": [],
  "column": [],
  "matrix": [],
  "unit": null,
  "groupNumber": "attribute_group_example",
  "valueType": null,
  "definingAttribute": null
}
```

## Dictionary

**dataType**: `dictionary`

Values are in the `dictionary` array (not `values` or `select`). Dictionary options are shared across attributes.

```json
{
  "id": "5f59cf80cff47e000c2ea630",
  "name": "Dictionary attribute example",
  "number": "dictionary-attribute-example-code",
  "groupName": "Attribute group example",
  "dataType": "dictionary",
  "values": [],
  "select": [],
  "dictionary": [
    {
      "id": "5f59cf80d60180000cb8c29d",
      "number": "first-code",
      "value": "First"
    },
    {
      "id": "5f59cf80d60180000cb8c29c",
      "number": "second-code",
      "value": "Second"
    }
  ],
  "column": [],
  "matrix": [],
  "unit": null,
  "groupNumber": "attribute_group_example",
  "valueType": null,
  "definingAttribute": null
}
```

## Column

**dataType**: `column`

A single row of key-value pairs. Values are in the `column` array.

```json
{
  "id": "60869a9152faff000cd1ab15",
  "name": "Column attribute example",
  "number": "column-attribute-example-code",
  "groupName": "Attribute group example",
  "dataType": "column",
  "values": [],
  "select": [],
  "dictionary": [],
  "column": [
    {
      "id": "60869a9152faff000cd1ab14",
      "name": "First",
      "value": "First cell"
    },
    {
      "id": "60869a9a52faff000cd1ab16",
      "name": "Second",
      "value": "Second cell"
    }
  ],
  "matrix": [],
  "unit": null,
  "groupNumber": "attribute_group_example",
  "valueType": null,
  "definingAttribute": null
}
```

## Matrix

**dataType**: `matrix`

A grid of rows x columns. The `matrix` array contains columns, each with a `rows` array.

```json
{
  "id": "60869b2b6b2f07000cacff77",
  "name": "Matrix attribute example",
  "number": "matrix-attribute-example-code",
  "groupName": "Attribute group example",
  "dataType": "matrix",
  "values": [],
  "select": [],
  "dictionary": [],
  "column": [],
  "matrix": [
    {
      "id": "60869b2b6b2f07000cacff76",
      "name": "First column",
      "rows": [
        { "id": "60869b2b6b2f07000cacff75", "name": "First row", "value": "First cell" },
        { "id": "60869b4c6b2f07000cacff78", "name": "Second row", "value": "Third cell" }
      ]
    },
    {
      "id": "60869b4c6b2f07000cacff79",
      "name": "Second column",
      "rows": [
        { "id": "60869b2b6b2f07000cacff75", "name": "First row", "value": "Second cell" },
        { "id": "60869b4c6b2f07000cacff78", "name": "Second row", "value": "Fourth cell" }
      ]
    }
  ],
  "unit": null,
  "groupNumber": "attribute_group_example",
  "valueType": null,
  "definingAttribute": null
}
```

## Compound

**dataType**: `text` (renders as text in API)

Compound attributes combine multiple sub-attributes into one display value. In the API response, they appear as `text` dataType.

```json
{
  "id": "60869ac96b2f07000cacff74",
  "name": "Compound attribute example",
  "number": "compound-attribute-example-code",
  "groupName": "Attribute group example",
  "dataType": "text",
  "values": ["42 Example text"],
  "select": [],
  "dictionary": [],
  "column": [],
  "matrix": [],
  "unit": null,
  "groupNumber": "attribute_group_example",
  "valueType": null,
  "definingAttribute": null
}
```

Note: Compound attributes are indistinguishable from regular text in the PAPI response. The `isCompound` field on the attribute definition (from `/attributes` endpoint) can be used to identify them.

## Quick reference table

| Type | dataType value | Value location | Notes |
|------|---------------|----------------|-------|
| Boolean | `boolean` | `values[0]` = "true"/"false" | |
| Text | `text` | `values[0]` | |
| Multiline | `multiline` | `values[0]` | Contains `\n` |
| Formatted Text | `formatted_text` | `values[0]` | Check `contentType` for markdown vs HTML |
| Integer | `integer` | `values[0]` | String, parse to int |
| Decimal | `decimal` | `values[0]` | String, parse to float/decimal |
| Date | `date` | `values[0]` | Format: YYYY-MM-DD |
| Date+Time | `date_time` | `values[0]` | Format: YYYY-MM-DD H:mm:ss |
| Time | `time` | `values[0]` | Format: HH:mm:ss |
| Pattern | `pattern` | `values[0]` | Regex-validated text |
| Single Select | `single_select` | `values[0]` + `select[]` | `select` has id, number, metadata |
| Multi Select | `multi_select` | `values[]` + `select[]` | Multiple selections |
| Dictionary | `dictionary` | `dictionary[]` | Shared options; `values` is empty |
| Column | `column` | `column[]` | Key-value pairs |
| Matrix | `matrix` | `matrix[]` | Columns with nested rows |
| Compound | `text` | `values[0]` | Indistinguishable from text in API |
