# Requirements

## Coding Challenge

Please read the instructions in their entirety before beginning your challenge.

We prefer symfony/api-platform, but you may use any framework to build a simple
RESTful API. Please take no more than 4 hours to complete the challenge and we
prefer you do your challenge in a single session.

## JSON Data

https://github.com/incompass/coding-challenge-assets/blob/master/hospitals.json

TODO

- [x] Create a repository in GitHub BEFORE adding any of your own code. If you
      use a generator or download of a framework, please commit ONLY the initial
      files from the framework with no modifications.
- [x] Use the JSON data to create a database schema for Hospitals and entries in
      a database.
- [x] Create a GET endpoint that returns the collection of Hospitals.
- [x] Create a GET endpoint that returns a single Hospital.
- [x] Create a POST endpoint that creates a single Hospital in the data store.
- [x] Create a PUT endpoint that modifies a single Hospital in the data store.
- [x] Create a DELETE endpoint that removes a single Hospital from the data
      store. Please commit your code at this point.
- [x] Add validation for the state name being a maximum of 2 characters when
      performing a POST or PUT. Please commit your code at this point.
- [x] Add the ability to filter the collection GET endpoint by city. Please
      commit your code at this point.
- [] Add the ability to order the collection GET endpoint by name. Please
  commit your code at this point.

BONUS

- [] Write functional tests for the endpoints (using behat if using api-platform).
- [] Write unit tests for any appropriate code (using phpunit if using php).
- [] Hook your project up to a build server (i.e. travis-ci.org) to run your tests.
- [] Add HTTP basic authentication to your API. Hardcoded usernames/passwords are fine.
- [] Using role based authentication, restrict POST/PUT/DELETE to an elevated
  user role (ADMIN) while allowing any user to perform GET requests. Hardcoded
  role data is fine.
- [] Containerize your project with docker.

MANDATORY

Create a README.md at the root of your repository and include instructions for
how we can get your project to run on our own machines.

If you complete functional/unit testing, please also include instructions for
running your tests. This is one of the most important parts of your challenge
and completeness of instructions is expected. We recommend you test your
instructions using a clean environment. DO NOT USE BOILERPLATE FOR THIS PLEASE
CLEAR ANY EXISTING BOILERPLATE FROM AN EXISTING README.
