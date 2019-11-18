
#~ ---
#~ title: "regex"
#~ author: "lsb"
#~ date: "2019, 10, 11"
#~ output: pdf_document
#~ ---


#~ La lectura básica para manejo de strings y expresiones regulares
#~ puede ser tanto man regex como man grep, PERO, existen n libros o
#~ manuales de diferente nivel de manejo. Todos son útiles.
#~  En R use el sistema básico de ayuda.

#~ Si lo desea puede consultar [https://www.gastonsanchez.com/r4strings/]


#~ Aunque muchas funciones vienen en r-base, lo más aconsejable es
#~ stringr.


#~ Para todos los casos prediga la posible salida dle comando antes de
#~ eejecutarlo y en caso de duda use ?; si la salida no conincide con sus
#~ expectativas revise las instrucciones usadas o su manejo de las
#~ funciones.


##

library(stringr)


#~ ¿Que espera obtener con cada instrucción?


nchar("South Pole") #numero de caracteres

paste("North","Pole",sep=".") #pega palabras, separa por punto

paste("North","and","South","Poles") #paste por defecto tiene espacio como separador
paste0("North","and","South","Poles") #paste0 por defecto no tiene separador

cat("North","and","South","Poles") #cat por defecto separa con espacios

cat("North","and","South","Poles",sep="\t") #se especifica tabulador como espacio

cat("North","and","South","Poles",sep="\n") #se especifica un enter como espacio


i <- 8
s <- sprintf("the square of %d is %d",i,i^2) #%d permite introducir valores dentro del enuncioado en la funcion sprintf
s

#~ ¿qué espera que haga?

for (i in 1:5) {
    fname <- sprintf("q%d.pdf",i)
    pdf(fname)
    hist(rnorm(100,sd=i))
    dev.off() #cierre el dispositivo
} #guarda 5 archivos en formato pdf con un histograma con una distribuci�n normal y un sd de 1 a 5 respectivamente

getwd() #dice donde esta el directorio


#
grep("pole",c("Equator","North Pole","South Pole")) #distinguir mayusculas de minusculas

grep("[Pp]ole",c("Equator","North Pole","South pole")) #puede ser con minuscula o mayuscula

grep("[Ppc]ole",c("Equator","North Pole","South pole")) #una sola instancia con multiples opciones

grep("o.e",c("Equator","North Pole","South Pole"))#. es un caracter especial diferente a /. - punto es cualquier caracter 
grep("o.e",c("Equator","North Pole","South Pole", "oe"))

grep("N.t",c("Equator","North Pole","South Pole")) #caracter N luego cualquier otro y luego una t

grep("N..t",c("Equator","North Pole","South Pole")) #caracter N luego otros dos y luego si t

grep("N...t",c("Equator","North Pole","South Pole"))#n tres cualquiera y t

grep("N?t",c("Equator","North Pole","South Pole")) #¿que paso aqui?** #N luego algo sin importal la cantiad de caracteres y luego t

grep("?",c("Equator","North Pole","South Pole")) #cualquier cosa

grep(".",c("Equator","North Pole","South Pole")) #cualquier 1 caracter

grep("[.]",c("abc","de","f.g")) #busca el punto como caracter
grep("\\.",c("abc","de","f.g")) #caracter de escape le dice q el siguiente es un caracter de punto

grep(".",c("abc","de","f.g")) #cualquier un caracter

grep(".",c("a","bc","bcd")) #tiene un caracter al menos? busca que tengan minimo q caracter

grep("..",c("a","bc","bcd")) #tiene dos caracter al menos? si

grep("...",c("a","bc","bcd")) #tiene tres caracter al menos? si


grep("\\.",c("abc","de","f.g")) #que tenga punto


x <- c("apple", "banana", "pear","adnon")
#str_extrac(vector, "indicacion")
#grep("inddicacion", vector)

str_extract(x, "an") #estraer el string, ¿cual an extrajo? extrajo solo an y no la palabra completa, banana

str_extract(x, "a.") #es punto de cualquier caracter o punto de caracter? cualquier caracter

str_extract(x, "a[dn]") #de adnon extrae ad o an? extrae a seguida de d o n

str_extract(x, "a.[dn]") #porq acá es diferente #el punto hace que incluya a ambas opciones

str_extract(x, "a.[d]") #al haber solo una opcion el punto es tomado como un caracter cualquier, osea busca un caracter cualquiera

str_extract(x, "a.[n]") #igual al anterior, pero aca si hay uno que cumple con la n y la d seria el punto

substring("Equator",3,5) #?substring - extrae desde la posición 3 a la 5

regexpr("uat","Equator") #logico
regexpr("ut","Equator") #?? porque reporta un menos uno y no in interger[0]
gregexpr("iss","Mississippi") #dos coninsidencia en tales posiciones de tanta posiicon

str_extract("Mississippi","iss")




#Algunas cosas de stringr

head(fruit)


str_extract(fruit, "nana") #cuantas tienen nana? 1


str_extract(fruit, regex("nana")) #que hace aca? que es diferente? es lo mismo, el anterioe es el shorthand


bananas <- c("banana", "Banana", "BANANA")

str_detect(bananas, "banana") #busca la banana tal cual, logico

str_detect(bananas, regex("banana", ignore_case = TRUE)) #regex hace una expacion, ignore_case=TRUE -> ignore mayusculas de minusculas

regex("banana", ignore_case = TRUE)


x

str_extract(x, ".a.")


x <- "a\\b" #lo identifica como caracter especial o como texto o como? como texto


writeLines(x) #es como cat pero mas especifico para escribir archivos de texto linea por linea

str_extract(x, "\\\\") #el primero le dice al segundo que es verdadero y el tercero le dice al cuarto que es verdadero







#~  Special characters - caracter raro. notacion especial


#~      \xhh: 2 hex digits.

#~      \x{hhhh}: 1-6 hex digits.

#~      \uhhhh: 4 hex digits.

#~      \Uhhhhhhhh: 8 hex digits.

#~ \N{name}, e.g. \N{grinning face} matches the basic smiling emoji.

#~  Similarly, you can specify many common control characters:

#~      \a: bell.

#~      \cX: match a control-X character.

#~      \e: escape (\u001B).

#~      \f: form feed (\u000C).

#~      \n: line feed (\u000A).

#~      \r: carriage return (\u000D).

#~      \t: horizontal tabulation (\u0009).

#~      \0ooo match an octal character. ‘ooo’ is from one to three 
#~      octal digits, from 000 to 0377. The leading zero is required.



x <- "n\u0301" #n con tilde

x

str_extract(x, ".") #que es punto? porque extrae lo la n y no lo demas. punto no extrae caracteres especiales

str_extract(x, "\\X") 
#primer \ indica algo, en este caso extrae todo, poruqe?? extrae los caracteres especiales

x <- "n\U0301"
x



#~  \s: matches any whitespace. #qie es im whitespace, espaciado, barra espaciadora, tab etc
#~  \S: matches any non-whitespace character. #para negar usar el mismo nombre en mayuscula




(text <- "Some  \t badly\n\t\tspaced \f text")
#\f formfit nueva pagina
text #funcion generica no esta diseñada para mostrar regex, muestra todo textual

print(text) #print
cat(text) #mas explicita
writeLine(text)

str_replace_all(text, "\\s+", "*") #tabulador espaciado y demas espaciadores
str_replace_all(text, "\\S+", "*") #lo mismo pero al revez, un asterisco por no espacio, no por letra




#~  \p{property name} matches any character with specific unicode
#~  property
#~  \P{property name}, matches all characters without the property. 
#~  http://www.unicode.org/reports/tr44/#Property_Index.


text1 <- c('"Double quotes"', "«Guillemet»", "“Fancy quotes”")
#añade "\"__\"" , una persona cuidados añade el slash inverso

text1

(text <- c('"Double quotes"', "«Guillemet»", "“Fancy quotes”"))


text1[1]

text[1]

str_replace_all(text1, "\\p{quotation mark}", "\"")  #repleza por las mismas comillas
#primer \ no se lee porque es el que indica al segundo que es real

str_replace_all(text1, "\\p{quotation mark}", "&") #otro ejemplo
str_replace_all(text1, "\\p{quotation mark}", "\\")
str_replace_all(text1, "\\p{quotation mark}", ".") #lo toma como punto, y no como caracter especiar porque aqui no estamos buscando



#~  \w matches any “word” character, 
#~  \W, matches any non-word character.



str_extract_all("Don't eat that!", "\\W+")[[1]] #saca las no palabras
str_extract_all("Don't eat that!", "\\w+")[[1]] #saca las palabras, el apostrofe no es alfa numerico así que divide la contraccion en dos palabras

str_split("Don't eat that!", "\\W")[[1]] #split separa las palas
str_split("Don't eat that!", "\\w")[[1]] 

## revisar tambien strsplit

strsplit("Don't eat that!", "\\W")

strsplit("Don't eat that!", "\\W")[[1]][2] #como es una lista puedo sacar una posicion especifica




substring("Don't eat that!",1,2) #del primer al segundo
substring("Don't eat that!",1,4) #del primer al cuarto

substring("Don't eat that!",2,1) #primero el mas pequeño, no voltea la palabra, eso es otra funcion

substring("Don't eat that!",3), #desde el primero, no espefica hasta donde asi que lo saca todo



#~  Technically, \w also matches connector punctuation, \u200c (zero
#~  width connector), and \u200d (zero width joiner), but these are
#~  rarely seen in the wild.

#~  \b matches word boundaries, the transition between word and
#~  non-word characters. \B matches the opposite: boundaries that have
#~  either both word or non-word characters on either side.



str_replace_all("The quick brown fox", "\\b", "_") #para cada pababra pone un bounderi al inicio y al final, no son espacios

str_replace_all("The quick brown fox", "\\B", "_") #los no bounderis entre letras que no son final de palabra-> 12 bounders
 
#codigos de referencia mas claros entre corchetes y dos puntos

#~      [:punct:]: punctuation.
#~      [:alpha:]: letters.
#~      [:lower:]: lowercase letters.
#~      [:upper:]: upperclass letters.
#~      [:digit:]: digits.
#~      [:xdigit:]: hex digits.
#~      [:alnum:]: letters and numbers.
#~      [:cntrl:]: control characters.
#~      [:graph:]: letters, numbers, and punctuation.
#~      [:print:]: letters, numbers, punctuation, and whitespace.
#~      [:space:]: space characters (basically equivalent to \s).
#~      [:blank:]: space and tab.

#~  These all go inside the [] for character classes,
#~  i.e. [[:digit:]AX] matches all digits, A, and X.

#~  You can also using Unicode properties, like [\p{Letter}], and
#~  various set operations, like [\p{Letter}--\p{script=latin}]. 

#~  | is the alternation operator, which will pick between one or more
#~  possible matches. For example, abc|def will match abc or def.


str_detect(c("abc", "def", "ghi"), "abc|def") #detecte entre acb o def




#~  You can use parentheses to override the default precedence rules:



str_extract(c("grey", "gray"), "gre|ay") #extrae las dos opciones textuales y no las palabras completas, extrajo de ambos pero no todo solo lo que le pedí

str_extract(c("grey", "gray"), "gr(e|a)y") #extrae la palabra completa, equivalente al sigiente

str_extract(c("grey", "gray"), "gr[ea]y") #este es el siguente, igual al anterior



#~  By default, regular expressions will match any part of a
#~  string. It’s often useful to anchor the regular expression so that it
#~  matches from the start or end of the string:

#~      ^ matches the start of string.
#~      $ matches the end of the string.



x <- c("apple", "banana", "pear")

str_extract(x, "^a") #extrae la que inicia con a

str_extract(x, "a$") #extrae l que termina con a

str_extract(x, "a.") # tiene un a y despues algo

str_extract(x, ".a") #tiene algo y despues una a 

str_extract(x, "^.a") #inicia con algo y luego a

str_extract(x, "a.$") #tiene un a, luego algo y asi termina




#ahora para mas de una linea de texto
#~  To match a literal “$” or “^”, you need to escape them, \$, and \^.

#~  For multiline strings, you can use regex(multiline = TRUE). This
#~  changes the behaviour of ^ and $, and introduces three new operators:

#~      ^ now matches the start of each line.

#~      $ now matches the end of each line.

#~      \A matches the start of the input.

#~      \z matches the end of the input.

#~      \Z matches the end of the input, but before the final line terminator, if it exists.



x <- "Line 1\nLine 2\nLine 3\n" #tres lineas
writeLines(x)

str_extract_all(x, "^Line..") #porque extrae solo la primera linea y no de todos?
#no usamos un sistema multilinea
str_extract_all(x, "^Line..")[[1]] #indicamos que solo busque en la primera linea

str_extract_all(x, regex("^Line..", multiline = TRUE))[[1]] #le indicamos que es multiline

str_extract_all(x, regex("^Line..", multiline = TRUE)) #ahora si sale sale el [[1]]


str_extract_all(x, regex("\\ALine..", multiline = TRUE))[[1]] #inicio de todo el x

str_extract_all(x, regex("\\aLine..", multiline = TRUE)) #character(0) porque no esta definido

str_extract_all(x, regex("\\ZLine..", multiline = TRUE))
str_extract_all(x, regex("\\zLine..", multiline = TRUE))



#~  There are two ways to include comments in a regular expression. 

#parentesis tiene significado en regex->asociar caracteres
str_detect("xyz", "x(?#this is a comment)") #lo que esta en parentesis es un cometario asi que solo busca la x


#otra forma de hacerlo - muy fic
phone <- regex("
  \\(!     # optional opening parens interrogacion es que si o que no
  (\\d{3}) # area code
  [)- ]?   # optional closing parens, dash, or space
  (\\d{3}) # another three numbers
  [ -]?    # optional space or dash
  (\\d{3}) # three more numbers
  ", comments = TRUE)

str_match("514-791-8141", phone)



## ejercicio en clase / casa

vectorCars <- c("juan1@hotmail.com",
                "2juanes@hotmail.com",
                "juaMes@hatmail.com",
                "pedro99@gmail.com",
                "pedro@hotmail.com",
                "pedro9@gmail.com",
                "peter11@xmail.com",
                "otroJujuan99@hotmail.com",
                "otrojuan99@gmail.com",
                "juanchito99@gmail.com",
                "superJuancho99@xmail.com",
                "mary01@gmail.com",
                "sistermarria@gmail.com",
                "marryMe@gmail.com",
                "maria01@gmail.com",
                "maRia01@gmail.com",
                "jhonBravo@gmail.xom",
                "johnBravo@gmail.com",
                "jaunMalEscritoBravin@gmiial.com",
                "jaunGravo@gmail.com",
                "JHONNY@gmail.com",
                "pedrito611@gmail.com",
                "marian@hotmail.com",
                "PedroMaria@gmail.com",
                "juanMaria@xmail.com",
                "JuanPedro@hotmaail.com",
                "pedroJuan@hotmail.com",
                "juanPedrito@hotmail.com")


### crear un regex para extraer del vectorCars

## 1. el mismo usario (explícito) en dos proveedores de correo

## 2. potencialmente el mismo usuario tanto en el mismo proveedor
## como en distintos proveedores.

## Para los dos casos suponga que solo existen tres nombres:
#### Maria / Juan / Pedro, en distintos idiomas


## 3. corrija de manera automatica los usarios o los dominios con nombres errados; preferiblemente escrito como una función.

grep("juan",vectorCars,ignore.case=T)

#¿Encontró a todos los juan?

    
