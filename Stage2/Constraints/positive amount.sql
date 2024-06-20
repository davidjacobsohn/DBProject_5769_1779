ALTER TABLE Salaries
ADD CONSTRAINT chk_amount_positive CHECK (Amount_ > 0);
