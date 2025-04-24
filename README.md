# README

This README would normally document whatever steps are necessary to get the
application up and running.

## Quick Start

### Restart Services
```bash
# Stop all services and rebuild
docker-compose down && docker-compose up --build -d

# Check services status
docker-compose ps
```

### API Testing
This endpoint tests Datadog APM SQL filtering configuration:

```yaml
apm_config:
  filter_tags:
    require: ["db:sql", "db.instance:mysql"]
    reject: ["outcome:success", "key2:value2"]
```

```bash
curl -X POST -H "Content-Type: application/json" \
  -d '{"test_record":{"name":"Test","description":"Testing db commit"}}' \
  http://localhost:3000/test_records
```

* ...
