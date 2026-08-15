# Migration Guide

This guide helps you update older Expressive Resume documents to the current command signatures.

## Scope

This migration covers:

1. Cover letter header command change.
2. Resume header argument shape.
3. Experience command requiring an explicit location argument.

## 1) Cover Letter Header Migration

The cover letter header now uses 5 positional arguments instead of key-value options.

### Old (key-value options)

```tex
\coverletterheader[
    firstname=John,
    middleinitial=N,
    lastname=Doe,
    email=john.doe@example.com,
    phone=123-456-7890,
    linkedin=johndoe,
    city=Town,
    state=State
]
```

### New (5 positional arguments)

```tex
\coverletterheader{John N. Doe}
  {\email{john.doe@example.com}}{\linkedin{johndoe}}
  {\phone{123-456-7890}}{\location{Town, State}}
```

### Argument mapping

1. Full name
2. Contact field 1
3. Contact field 2
4. Contact field 3
5. Contact field 4

Use existing helper commands inside those contact fields:

```tex
\email{you@example.com}
\phone{123-456-7890}
\linkedin{username}
\github{username}
\location{City, State}
```

## 2) Resume Header Migration

Resume header remains a 5-argument command. If you were using an older custom form, update to this shape.

### Current signature

```tex
\resumeheader{Full Name}
  {contact info - 1}{contact info - 2}
  {contact info - 3}{contact info - 4}
```

### Example

```tex
\resumeheader{John N. Doe}
  {\email{john.doe@example.com}}{\linkedin{thehale}}
  {\github{thehale}}{\phone{123-456-7890}}
```

## 3) Experience Command Migration (Extra Location Parameter)

Experience entries require 3 arguments:

1. Organization
2. Location
3. Roles/body block

### Old (missing location)

```tex
\experience{Radiant Software Systems}{%
    \role{Software Engineer}{2021 - 2024}{
        \achievement{Developed feature X}
    }
}
```

### New (with location)

```tex
\experience{Radiant Software Systems}{Super City, State}{%
    \role{Software Engineer}{2021 - 2024}{
        \achievement{Developed feature X}
    }
}
```

## Quick Upgrade Checklist

1. Replace every `\coverletterheader[...]` with `\coverletterheader{...}{...}{...}{...}{...}`.
2. Confirm each `\resumeheader` has exactly 5 arguments.
3. Confirm each `\experience` has exactly 3 arguments, including location as argument 2.

## Common Symptoms After Upgrade

1. Header renders incorrectly: argument count is wrong or braces are unmatched.
2. Experience layout breaks: location argument is missing.
3. Contact links not clickable: raw text used instead of helper commands like `\email` or `\phone`.
