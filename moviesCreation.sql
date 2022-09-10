CREATE SCHEMA IF NOT EXISTS `moviesdb` DEFAULT CHARACTER SET utf8 ;
USE `moviesdb` ;
-- -----------------------------------------------------
-- Table `moviesdb`.`persons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `moviesdb`.`persons` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL,
  `dob` DATE NULL,
  PRIMARY KEY (`id`));
-- -----------------------------------------------------
-- Table `moviesdb`.`movies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `moviesdb`.`movies` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL,
  `year` INT NULL,
  `rating` DOUBLE NULL,
  `runtime` DOUBLE NULL,
  `genre` VARCHAR(255) NULL,
  `earnings_rank` INT NULL,
  PRIMARY KEY (`id`));
-- -----------------------------------------------------
-- Table `moviesdb`.`actors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `moviesdb`.`actors` (
  `actor_id` INT NOT NULL,
  `movie_id` INT NOT NULL,
  PRIMARY KEY (`actor_id`, `movie_id`),
  CONSTRAINT `fk_persons_has_movies_persons`
    FOREIGN KEY (`actor_id`)
    REFERENCES `moviesdb`.`persons` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_persons_has_movies_movies1`
    FOREIGN KEY (`movie_id`)
    REFERENCES `moviesdb`.`movies` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
-- -----------------------------------------------------
-- Table `moviesdb`.`directors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `moviesdb`.`directors` (
  `director_id` INT NOT NULL,
  `movie_id` INT NOT NULL,
  PRIMARY KEY (`director_id`, `movie_id`),
  CONSTRAINT `fk_persons_has_movies_persons1`
    FOREIGN KEY (`director_id`)
    REFERENCES `moviesdb`.`persons` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_persons_has_movies_movies2`
    FOREIGN KEY (`movie_id`)
    REFERENCES `moviesdb`.`movies` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
-- -----------------------------------------------------
-- Table `moviesdb`.`oscars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `moviesdb`.`oscars` (
  `person_id` INT NOT NULL,
  `movie_id` INT NOT NULL,
  `type` VARCHAR(255) NULL,
  `year` INT NULL,
  PRIMARY KEY (`person_id`, `movie_id`),
  CONSTRAINT `fk_persons_has_movies_persons2`
    FOREIGN KEY (`person_id`)
    REFERENCES `moviesdb`.`persons` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_persons_has_movies_movies3`
    FOREIGN KEY (`movie_id`)
    REFERENCES `moviesdb`.`movies` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
