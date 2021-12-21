# infra

This repository contains some of the configuration files for the self-hosted infrastructure and services used by my open source projects.

I hope that by open-sourcing these configurations, other people can learn from my setup and/or tell me what I'm doing wrong. 

* Each service has a docker-compose file and a nginx config. That's really all that's needed config-wise.
* The contents of the data volumes are also important, but these are periodically backed up to a remote storage bucket.
* API keys, certificates and passwords are passed to containers using environment variables. There is a script (`exportenv.sh`) which collates these for export and safe-keeping.

### Background

My aim is to:

* minimise the time and effort required to maintain self-hosted services
* minimise the time I might have to spend to rebuild these systems [in the event of a total loss](https://www.reuters.com/article/us-france-ovh-fire-idUSKBN2B20NU)

I think adding redundancy or automatic failover is probably out of scope for the time being, but there some improvements that can be made in the meantime. I'm trying to slowly move things to serverless/cloud platforms instead of hosting myself but unfortunately, doing this for everything is prohibitively expensive.

### License

MIT, have fun :)
