# Docker Ruby APM Demo

This is a demonstration project showing how to integrate Datadog APM (Application Performance Monitoring) with a Ruby on Rails application running in Docker containers.

## Features

- Ruby on Rails 5.2 application
- MySQL 5.7 database
- Datadog APM integration
- Docker and Docker Compose setup
- Example API endpoints for testing APM functionality

## Prerequisites

- Docker and Docker Compose
- Datadog account and API key
- Ruby 2.7.8 (for local development)

## Environment Setup

1. Clone the repository:
```bash
git clone https://github.com/yuandesu/docker-ruby-apm.git
cd docker-ruby-apm
```

2. Set up your Datadog API key:
```bash
export DD_API_KEY=your_api_key_here
```

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

## Project Structure

- `app/` - Rails application code
- `config/` - Rails and Datadog configuration
- `db/` - Database migrations and schema
- `docker-compose.yml` - Docker services configuration
- `Dockerfile` - Rails application container configuration
- `datadog.yaml` - Datadog agent configuration

## Datadog Integration

### Features Enabled
- APM (Application Performance Monitoring)
- Log Collection
- Container Monitoring
- Custom Metrics

### Configuration
The Datadog agent is configured with:
- APM enabled
- Log collection enabled
- Container metrics collection
- Custom span analysis for Rails requests

## Development

### Local Setup
1. Install dependencies:
```bash
bundle install
```

2. Set up database:
```bash
rails db:create db:migrate
```

3. Start the development server:
```bash
rails server
```

### Docker Development
1. Build the containers:
```bash
docker-compose build
```

2. Start the services:
```bash
docker-compose up
```

3. Run database migrations:
```bash
docker-compose exec web rails db:migrate
```

## Monitoring

1. Access your Datadog dashboard
2. Check APM traces under APM > Services
3. View logs under Logs > Search
4. Monitor containers under Infrastructure > Containers

## Troubleshooting

### Common Issues
1. If the Datadog agent isn't receiving data:
   - Check if DD_API_KEY is properly set
   - Verify agent health with `docker-compose logs datadog`
   - Ensure ports 8126 (APM) are accessible

2. If database connection fails:
   - Wait for MySQL to be fully initialized
   - Check database credentials in docker-compose.yml
   - Verify database container health with `docker-compose ps`

## Contributing

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a new Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.
