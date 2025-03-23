-- Create Rooms Table
CREATE TABLE Rooms (
    room_id NUMBER PRIMARY KEY,
    room_type VARCHAR2(50) NOT NULL,
    price_per_night NUMBER NOT NULL,
    amenities VARCHAR2(255),
    availability VARCHAR2(10) CHECK (availability IN ('Available', 'Booked'))
);

-- Create Bookings Table
CREATE TABLE Bookings (
    booking_id NUMBER PRIMARY KEY,
    customer_name VARCHAR2(100) NOT NULL,
    check_in_date DATE NOT NULL,
    check_out_date DATE NOT NULL,
    room_id NUMBER REFERENCES Rooms(room_id),
    total_price NUMBER NOT NULL
);

-- Create Payments Table
CREATE TABLE Payments (
    payment_id NUMBER PRIMARY KEY,
    booking_id NUMBER REFERENCES Bookings(booking_id),
    amount_paid NUMBER NOT NULL,
    payment_status VARCHAR2(20) CHECK (payment_status IN ('Pending', 'Completed'))
);

-- Insert Sample Room Data
INSERT INTO Rooms VALUES (1, 'Deluxe Suite', 200, 'WiFi, TV, Mini Bar', 'Available');
INSERT INTO Rooms VALUES (2, 'Standard Room', 100, 'WiFi, TV', 'Available');
INSERT INTO Rooms VALUES (3, 'Presidential Suite', 500, 'WiFi, TV, Mini Bar, Jacuzzi', 'Available');

-- Insert Sample Booking Data
INSERT INTO Bookings VALUES (1, 'John Doe', TO_DATE('2025-04-01', 'YYYY-MM-DD'), TO_DATE('2025-04-05', 'YYYY-MM-DD'), 1, 800);

-- Insert Sample Payment Data
INSERT INTO Payments VALUES (1, 1, 800, 'Completed');
