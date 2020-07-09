<h1 align="center">
  Private Events
</h1>

## Table of Contents

* [About the Project](#about-the-project)
* [App Diagram](#app-diagram)
* [Built With](#built-with)
* [Prerequisites](#prerequisites)
* [Install](#install)
* [Authors](#authors)
* [Contributing](#contributing)
* [Acknowledgments](#acknowledgments)
* [License](#license)

## About the project

> This application lets the users create new events, attend it, and invite other users to their own. 

---

## App Diagram
![Screenshot - 1920 x 1080 ](/assets/private-events-diagram.jpg?raw=true "App diagram")

---

## Built With

- Ruby 2.7.1
- Rails 6.0.2.2
- Rspec 3.9
---

## Prerequisites

- Ruby 2.7.1
- postgresql 10.12


## Install

`git clone https://github.com/AlfredoElizarraras/Private-events.git`

### On the command line:
- `sudo -u postgres psql`
- `CREATE ROLE events WITH CREATEDB LOGIN PASSWORD 'pass123';`
- `Exit postgres console \q`
- `Make sure you have your yarn packages up to date. If not:`
- `yarn install --check-files`

### Before testing
(For running the test you will need to install capybara web kit before the bundle)
- `sudo apt-get update`
- `sudo apt-get install qt5-default libqt5webkit5-dev gstreamer1.0-plugins-base gstreamer1.0-tools gstreamer1.0-x`
- `bundler install`
- `rails db:setup`

## Authors

> This project is completed by Carlos Santamaría and Oscar Alfredo Gómez Elizarrarás, in partial requirements of the Microverse cirriculum.

👤 **Carlos Santamaria**

- Github: [@flakster](https://github.com/flakster)
- Twitter: [@flakster](https://twitter.com/flakster)
- Linkedin: [@cjsb](https://www.linkedin.com/in/cjsb)

👤 **Oscar Alfredo Gómez Elizarrarás**

- Github: [@AlfredoElizarraras](https://github.com/AlfredoElizarraras)
- Twitter: [@OscarAlfredoGm4](https://twitter.com/OscarAlfredoGm4)
- Linkedin: [@OscarAlfredoGómezElizarrarás](https://mx.linkedin.com/in/oscar-alfredo-gomez-elizarraras)

---

## Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](https://github.com/AlfredoElizarraras/Private-events/issues).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- [Microverse](https://microverse.org)
- [Odin project](https://www.theodinproject.com/)

---

## License

This project is [MIT](https://github.com/AlfredoElizarraras/Private-events/blob/master/LICENSE) licensed.

Copyright 2020 Carlos Santamaria and Oscar Alfredo Gómez Elizarrarás

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

---
