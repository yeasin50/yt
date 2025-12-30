---
title: "Markdown"
date: 2025-11-18T20:00:00+06:00
description: "Minimalist text formatting language"
draft: false
weight: 1
tags: ["productivity", "markdown"]
---

আজকে আমরা শিখব **Markdown** – এটা হলো একটা লাইটওয়েট মার্কআপ ল্যাঙ্গুয়েজ,  
যেটা ব্যবহার করে আপনি **সহজ plain text লিখে সুন্দর ফরম্যাটেড ডকুমেন্ট তৈরি করতে পারবেন।**

{{< youtube MRHHn-vybjo >}}

### Headings

- `# Heading 1`
- `## Heading 2`
- `### Heading 3`

> Up to 6 `#`, used for title, subtitle, sections.

---

### Bold & Italic

- `**Bold**` → **Bold**
- `*Italic*` → _Italic_
- `***Bold Italic***` → **_Bold Italic_**

---

### Lists

- Unordered:

```markdown
- Item 1
- Item 2
```

- Ordered list

```markdown
1. First
2. Second
```

- Task List:

```markdown
- [x] Done
- [ ] To Do
```

---

### Blockquote

```markdown
> এই লাইনটা ব্লককোট হিসেবে দেখাবে
```

> এই লাইনটা ব্লককোট হিসেবে দেখাবে

---

### Code

Inline code: `code` → code

Code block:

````markdown
```language
void main(){

}
```
````

### Link

```markdown
[Google](https://google.com)
```

### Image

```markdown
Image: ![Alt text](image.png)
```

---

### Tables

Table

```markdown
| Name | Age |
| ---- | --- |
| Asif | 24  |
| Rumi | 30  |
```

| Name | Age |
| ---- | --- |
| Asif | 24  |
| Rumi | 30  |

### Divider

```markdown
---
```

### Details summary

<details>
<summary> markdown used by </summary>

- <span style= "color:red"> Docs </span>
- Obsidian
- Static website generators
- .....

</details>

```markdown
<details>
<summary> markdown used by </summary>

- <span style= "color:red"> Docs </span>
- Obsidian
- Static website generators
- .....

</details>
```

## Math with LaTeX

Inline math: `$E = mc^2$`

Blockquote

```
$$
\frac{1}{n}\sum_{i=1}^{n} x_i
$$
```

### HTML

Inline HTML (যখন Markdown সাপোর্ট করে না):

```
<span style= "color:red"> Docs </span>

<mark>Highlighted text</mark>
```

<span style= "color:red"> Docs </span>

<mark>Highlighted text</mark>
