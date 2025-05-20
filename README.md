# Evolusi Park Backend Server

Evolusi Park Backend Server for Parking System

Tech Stack:

1. Argon (Hashing password)
2. Cloudinary (Store assets in the cloud)
3. CORS
4. dotenv
5. ExpressJs (For making RESTFUL API)
6. JWT
7. Day js
8. Multer
9. Multer Storage Cloudinary
10. Node Postgres
11. Sequelize ORM

## Installation

Don't forget to add Environment Variable before running the application, here the list of env i provided:

DB_USERNAME\
DB_PASSWORD\
DB_NAME\
DB_HOST\
DB_PORT\
NODE_ENV\
APP_SECRET

Install fw15-backend with npm

```bash
  git clone https://github.com/Evosist/evolusipark_backend
  cd evolusipark_backend
  pnpm install
  pnpm run dev
```

Open http://localhost:3000 with your browser to see the result

## API Endpoints

### 🔐 Authentication

#### POST /api/auth/login

**Description:** Logs in a user.

**Request Body:**

```json
{
    "email": "",
    "password": ""
}
```

#### POST /auth/register

**Description:** Registering a user.

**Request Body:**

```json
{
    "nama": "",
    "jenis_kelamin": "",
    "no_hp": "",
    "alamat_lengkap": "",
    "username": "",
    "password": "",
    "level_id": ""
}
```
