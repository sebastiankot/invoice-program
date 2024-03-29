CREATE TABLE IF NOT EXISTS business_details
(
    ID            BIGINT AUTO_INCREMENT PRIMARY KEY,
    FULL_NAME     VARCHAR(150) NOT NULL,
    ADDRESS       VARCHAR(80)  NOT NULL,
    POSTAL_CODE   VARCHAR(6)   NOT NULL,
    CITY          VARCHAR(50)  NOT NULL,
    COUNTRY       VARCHAR(50)  NOT NULL,
    TAX_ID        INT(11)      NOT NULL,
    EMAIL_ADDRESS VARCHAR(100) NOT NULL
);

-- TODO: Jeśli starczy czasu
-- CREATE TABLE IF NOT EXISTS USERS
-- (
--     ID          SERIAL PRIMARY KEY,
--     BUSINESS_ID INT,
--     USERNAME    VARCHAR(50)  NOT NULL,
--     PASSWORD    VARCHAR(100) NOT NULL,
--     EMAIL       VARCHAR(80)  NOT NULL,
--     ENABLED     VARCHAR(45)  NOT NULL,
--     GROUP_NAME  VARCHAR(45)  NOT NULL,
--     FOREIGN KEY (BUSINESS_ID) REFERENCES BUSINESS_DETAILS (ID)
-- );

CREATE TABLE IF NOT EXISTS customers
(
    ID                   BIGINT AUTO_INCREMENT PRIMARY KEY,
    BUSINESS_ID          BIGINT       NOT NULL,
    CUSTOMER_NAME        VARCHAR(80)  NOT NULL,
    BUSINESS_NAME        VARCHAR(150) NOT NULL,
    BUSINESS_ADDRESS     VARCHAR(80)  NOT NULL,
    BUSINESS_POSTAL_CODE VARCHAR(6)   NOT NULL,
    BUSINESS_CITY        VARCHAR(50)  NOT NULL,
    BUSINESS_COUNTRY     VARCHAR(80)  NOT NULL,
    TAX_ID               INT(11)      NOT NULL,
    EMAIL_ADDRESS        VARCHAR(80)  NOT NULL,
    FOREIGN KEY (BUSINESS_ID) REFERENCES business_details (ID) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS invoices
(
    ID                         BIGINT AUTO_INCREMENT PRIMARY KEY,
    BUSINESS_ID                BIGINT         NOT NULL,
    CUSTOMER_ID                BIGINT         NOT NULL,
    INVOICE_NUMBER             VARCHAR(80)    NOT NULL,
    CREATED_DATE               DATE           NOT NULL,
    ISSUE_DATE                 DATE           NOT NULL,
    DUE_DATE                   DATE           NOT NULL,
    PAYMENT_METHOD             VARCHAR(45)    NOT NULL,
    NET_PRICE                  DECIMAL(10, 2) NOT NULL,
    TAX_VALUE                  DECIMAL(10, 2) NOT NULL,
    GROSS_PRICE                DECIMAL(10, 2) NOT NULL,
    INCLUDE_PAYMENT            DECIMAL(10, 2),
    CURRENCY_NAME              VARCHAR(5)     NOT NULL,
    OTHER_CURRENCY_NAME        VARCHAR(5),
    OTHER_CURRENCY_GROSS_PRICE DECIMAL(10, 2),
    EXCHANGE_RATE              DECIMAL(10, 5),
    FOREIGN KEY (BUSINESS_ID) REFERENCES business_details (ID),
    FOREIGN KEY (CUSTOMER_ID) REFERENCES customers (ID)
);

CREATE TABLE IF NOT EXISTS invoice_payment
(
    ID            BIGINT AUTO_INCREMENT PRIMARY KEY,
    INVOICE_ID    BIGINT         NOT NULL,
    PAYMENT_DATE  DATE           NOT NULL,
    PAYMENT_VALUE DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (INVOICE_ID) REFERENCES invoices (ID) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS invoices_gtu
(
    ID         BIGINT AUTO_INCREMENT PRIMARY KEY,
    INVOICE_ID BIGINT     NOT NULL,
    GTU_TYPE   VARCHAR(6) NOT NULL,
    FOREIGN KEY (INVOICE_ID) REFERENCES invoices (ID)
);

CREATE TABLE IF NOT EXISTS invoices_items
(
    ID               BIGINT AUTO_INCREMENT PRIMARY KEY,
    INVOICE_ID       BIGINT         NOT NULL,
    NAME             VARCHAR(80)    NOT NULL,
    QUANTITY         INT(10)        NOT NULL,
    SINGLE_NET_PRICE DECIMAL(10, 2) NOT NULL,
    NET_PRICE        DECIMAL(10, 2) NOT NULL,
    TAX_PERCENT      DOUBLE         NOT NULL,
    TAX_VALUE        DECIMAL(10, 2) NOT NULL,
    GROSS_PRICE      DECIMAL(10, 2) NOT NULL,
    DISCOUNT         DOUBLE DEFAULT 0.00,
    FOREIGN KEY (INVOICE_ID) REFERENCES invoices (ID) ON DELETE CASCADE
);
