PrivateGPT.

This container is based of https://github.com/SamurAIGPT/privateGPT/ it is slightly modified to handle the hostname.

```
docker run -d --name PrivateGPT \
  -p 3000:3000 \
  -p 5000:5000 \
  rattydave/privategpt
```

Access via http://<DOCKER_HOST>:3000

The supported extensions for documents are:
* .csv: CSV
* .docx: Word Documen,
* .enex: EverNote
* .eml: Email
* .epub: EPub
* .html: HTML File
* .md: Markdown
* .msg: Outlook Message
* .odt: Open Document Text
* .pdf: Portable Document Format (PDF)
* .pptx : PowerPoint Document
* .txt: Text file (UTF-8)

All the import plugins are pre installed.

Please note
 * this is NOT GPU enabled
 * needs 16GB RAM (will run with less but slower)
 * responses take a while (depends on CPU. 4 core about 10 mins, 24 cores less than 1 min)

