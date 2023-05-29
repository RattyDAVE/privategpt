PrivateGPT.

```
docker run -d --name PrivateGPT \
  -p 3000:3000 \
  -p 5000:5000 \
  rattydave/privategpt
```

Access via http://<DOCKER_HOST>:3000

Please note
  this is NOT GPU enabled
  needs 16GB RAM (will run with less but slower)
  responses take a while (depends on CPU. 4 core about 10 mins)
  
