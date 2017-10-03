# Build Status Service

### Disclaimer

This build status service only accounts for the following jenkins statuses
-   `blue` -> build passing
-   `blue_anime` -> build passing
-   `red` - build fail
-   the rest - build inaccessible

### Setting Up

Host this rails application somewhere! If you have no idea where to start, these are some of the places you can start looking into.
- Digital Ocean
- Amazon Web Services
- Heroku
- Pivotal Web Services

For your application to work, remember to set these 2 environment variables
```
JENKINS_USR=<Jenkins_USERNAME>
JENKINS_PWD=<Jenkins_PASSWORD>
```

### How to use?

Look at the breadcrumbs in your jenkins dashboard and specify the job tree. **Note that its case sensitive!**
```
https://<URL to your application>/jenkins?job=ArchitectureProcesses,Sauron,master
```

**You are strong advised to try the link on your browser before adding it into your readme!**


### Feeling like contributing?
1. Clone
2. New Branch
3. Pull Request
