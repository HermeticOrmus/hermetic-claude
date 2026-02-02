---
description: Design and document API endpoints
thinking: true
---

# API Design

Help me design, implement, or document API endpoints.

## API Design Principles

1. **RESTful Design**
   - Resource-based URLs
   - Proper HTTP methods (GET, POST, PUT, DELETE)
   - Status codes that make sense
   - Consistent naming conventions

2. **Request/Response Format**
   - JSON by default
   - Clear request body structure
   - Consistent response format
   - Error response format

3. **Versioning**
   - API version strategy
   - Backward compatibility
   - Deprecation policy

4. **Security**
   - Authentication method
   - Authorization rules
   - Input validation
   - Rate limiting

## Endpoint Documentation

For each endpoint provide:

```
### Endpoint Name
**Method**: GET/POST/PUT/DELETE
**Path**: /api/v1/resource/:id
**Description**: What this endpoint does

**Authentication**: Required/Optional
**Authorization**: Who can access this

**Request Parameters**:
- Path params
- Query params
- Request body

**Response**:
- Success (200, 201, etc.)
- Error cases (400, 401, 404, 500, etc.)

**Example Request**:
```json
{
  "field": "value"
}
```

**Example Response**:
```json
{
  "data": {},
  "status": "success"
}
```

**Notes**: Any special considerations
```

Help me design clear, consistent, secure APIs.
