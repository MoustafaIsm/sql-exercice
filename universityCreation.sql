CREATE SCHEMA IF NOT EXISTS `universitydb` DEFAULT CHARACTER SET utf8 ;
USE `universitydb` ;
-- -----------------------------------------------------
-- Table `universitydb`.`students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `universitydb`.`students` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL,
  PRIMARY KEY (`id`));
-- -----------------------------------------------------
-- Table `universitydb`.`departments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `universitydb`.`departments` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL,
  `office` VARCHAR(255) NULL,
  PRIMARY KEY (`id`));
-- -----------------------------------------------------
-- Table `universitydb`.`rooms`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `universitydb`.`rooms` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL,
  `capacity` INT NULL,
  PRIMARY KEY (`id`));
-- -----------------------------------------------------
-- Table `universitydb`.`courses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `universitydb`.`courses` (
  `course_name` VARCHAR(255) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `start_time` TIME NULL,
  `end_time` TIME NULL,
  `room_id` INT NOT NULL,
  PRIMARY KEY (`course_name`),
  CONSTRAINT `fk_courses_rooms`
    FOREIGN KEY (`room_id`)
    REFERENCES `universitydb`.`rooms` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
-- -----------------------------------------------------
-- Table `universitydb`.`majorsIn`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `universitydb`.`majorsIn` (
  `student_id` INT NOT NULL,
  `department_id` INT NOT NULL,
  PRIMARY KEY (`student_id`, `department_id`),
  CONSTRAINT `fk_students_has_departments_students1`
    FOREIGN KEY (`student_id`)
    REFERENCES `universitydb`.`students` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_students_has_departments_departments1`
    FOREIGN KEY (`department_id`)
    REFERENCES `universitydb`.`departments` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
-- -----------------------------------------------------
-- Table `universitydb`.`enrolled`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `universitydb`.`enrolled` (
  `course_name` VARCHAR(255) NOT NULL,
  `student_id` INT NOT NULL,
  `credit_status` VARCHAR(255) NULL,
  PRIMARY KEY (`course_name`, `student_id`),
  CONSTRAINT `fk_courses_has_students_courses1`
    FOREIGN KEY (`course_name`)
    REFERENCES `universitydb`.`courses` (`course_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_courses_has_students_students1`
    FOREIGN KEY (`student_id`)
    REFERENCES `universitydb`.`students` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);