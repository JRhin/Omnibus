---
title: <% tp.file.title %>
created: <% tp.file.creation_date("YYYY-MM-DD") %>
authors:
tags:<%* 
const folderPath = tp.file.folder(absolute=true);
const tags = folderPath ? folderPath.split('/').map(dir => dir.trim().replace(/ /g, '_')) : [];
tR += `\n${tags.map(tag => ` - ${tag}`).join('\n')}`;
%>
 - ToDo
---
