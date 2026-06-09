-- USERS TABLE
CREATE TABLE users (
  id          SERIAL PRIMARY KEY,
  name        VARCHAR(100) NOT NULL,
  email       VARCHAR(150) UNIQUE NOT NULL,
  password    VARCHAR(255) NOT NULL,
  role        VARCHAR(20) DEFAULT 'buyer',
  avatar_url  TEXT,
  bio         TEXT,
  created_at  TIMESTAMP DEFAULT NOW()
);

-- GIGS TABLE
CREATE TABLE gigs (
  id           SERIAL PRIMARY KEY,
  seller_id    INT REFERENCES users(id) ON DELETE CASCADE,
  title        VARCHAR(200) NOT NULL,
  description  TEXT,
  category     VARCHAR(100),
  price        DECIMAL(10,2) NOT NULL,
  delivery_days INT DEFAULT 3,
  image_url    TEXT,
  is_active    BOOLEAN DEFAULT TRUE,
  created_at   TIMESTAMP DEFAULT NOW()
);

-- ORDERS TABLE
CREATE TABLE orders (
  id           SERIAL PRIMARY KEY,
  gig_id       INT REFERENCES gigs(id),
  buyer_id     INT REFERENCES users(id),
  seller_id    INT REFERENCES users(id),
  status       VARCHAR(30) DEFAULT 'pending',
  price        DECIMAL(10,2) NOT NULL,
  requirements TEXT,
  deadline     DATE,
  created_at   TIMESTAMP DEFAULT NOW()
);

-- PAYMENTS TABLE
CREATE TABLE payments (
  id             SERIAL PRIMARY KEY,
  order_id       INT REFERENCES orders(id),
  buyer_id       INT REFERENCES users(id),
  amount         DECIMAL(10,2) NOT NULL,
  currency       VARCHAR(10) DEFAULT 'USD',
  status         VARCHAR(30) DEFAULT 'pending',
  payment_method VARCHAR(50),
  transaction_id VARCHAR(200),
  created_at     TIMESTAMP DEFAULT NOW()
);

-- REVIEWS TABLE
CREATE TABLE reviews (
  id          SERIAL PRIMARY KEY,
  order_id    INT REFERENCES orders(id),
  gig_id      INT REFERENCES gigs(id),
  reviewer_id INT REFERENCES users(id),
  rating      INT CHECK (rating >= 1 AND rating <= 5),
  comment     TEXT,
  created_at  TIMESTAMP DEFAULT NOW()
);