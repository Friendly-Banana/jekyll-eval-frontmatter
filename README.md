This is a Jekyll plugin to evaluate Ruby code in the frontmatter.

If you want to use it, copy the Ruby file into your _plugins folder.

The plugin will find and execute all code in frontmatter values matching the regex `eval(<code>)`.

For example
```md
---
date: 'eval(site.time.strftime("%Y-%m-%d %H:%M:%S"))'
---
```

will render the current time when building.

You can access everything from Ruby, the current `page`, the entire `site` etc..
