# task_2

Sama seperti projek task 1, projek ini menggunakan module based architecture, pemilihan module based architecture sendiri berdasarkan dari pengalaman pribadi bahwa ketika codebase aplikasi mulai besar dan mempunyai fitur yang mulai banyak, jika projek menggunakan layer based architecture maka akan kesusahan untuk memanage codebase dari projek tersebut.

```shell
root
└───src
    ├───extension
    ├───modules
    │   └───home
    │       ├───data
    │       │   └───repositories
    │       ├───domain
    │       │   ├───entities
    │       │   └───repositories
    │       └───presentation
    │           └───widgets
    │               ├───atoms
    │               ├───molecules
    │               └───organism
    ├───ui
    └───utils

```
