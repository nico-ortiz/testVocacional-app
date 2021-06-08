#Clean Dataset
Survey.all.map{|survey| survey.destroy}
Outcome.all.map{|outcome| outcome.destroy}
Career.all.map{|career| career.destroy}
Choice.all.map{|choice| choice.destroy}
Question.all.map{|question| question.destroy}
Outcome.all.map{|outcome| outcome.destroy}

#Create Careers
economia = Career.create(name: 'Economia')
agronomia = Career.create(name: 'Agronomia')
arquitectura = Career.create(name: 'Arquitectura')
arte = Career.create(name: 'Arte')
computacion = Career.create(name: 'Computacion')
educacionFisica = Career.create(name: 'Educacion Fisica')
filosofia = Career.create(name: 'Filosofia')
fisica = Career.create(name: 'Fisica')
geologia = Career.create(name: 'Geologia')
historia = Career.create(name: 'Historia')
literatura = Career.create(name: 'Literatura')
matematicas = Career.create(name: 'Matematicas')
medicina = Career.create(name: 'Medicina')
periodismo = Career.create(name: 'Periodismo')
quimica = Career.create(name: 'Quimica')
sociologia = Career.create(name: 'Sociologia')
veterinaria = Career.create(name: 'Veterinaria')


#Questions
question1 = Question.create(number: 1, description: 'Me trasladaria a una zona agricola/ganadera para ejercer mi profesion.', name: 'Question 1', type: 'type 1')
question2 = Question.create(number: 2, description: 'Tengo buena memoria y no me cuesta estudiar y retener fórmulas y palabras técnicas.', name: 'Question 2', type: 'type 2')
question3 = Question.create(number: 3, description: 'Me gusta escribir. En general mis trabajos son largos y están bien organizados.', name: 'Question 3', type: 'type 3')
question4 = Question.create(number: 4, description: 'Sé quien es Steven Hawking: Conozco y me atraen sus descubrimientos.', name: 'Question 4', type: 'type 4')
question5 = Question.create(number: 5, description: 'Me actualizo respecto de los avances tecnológicos y me intereso por investigar y conocer', name: 'Question 5', type: 'type 5')
question6 = Question.create(number: 6, description: 'Sé quien es Andy Warhol y a qué movimiento artístico pertenece. Me apasiona conocer acerca del arte y sus exponentes.', name: 'Question 6', type: 'type 6')
question7 = Question.create(number: 7, description: 'En general me intereso por las dificultades que ha tenido que atravesar la humanidad y cómo lo ha superado.', name: 'Question 7', type: 'type 7')
question8 = Question.create(number: 8, description: 'Me apasiona leer y no me importa si el libro que elijo tiene muchas páginas, para mí es un gran entretenimiento.', name: 'Question 8', type: 'type 8')
question9 = Question.create(number: 9, description: 'Me atrae conocer los procesos y las áreas que hacen funcionar a las empresas.', name: 'Question 9', type: 'type 9')
question10 = Question.create(number: 10, description: ' Me siento identificado con el pensamiento de algunos filósofos y escritores.', name: 'Question 10', type: 'type 10')
question11 = Question.create(number: 11, description: 'Me encanta estudiar el cuerpo humano y conocer cómo funciona. Además, no me impresiona la sangre.', name: 'Question 11', type: 'type 11')
question12 = Question.create(number: 12, description: 'Si pudiera elegir, pasaría mucho tiempo diseñando novedosos objetos o edificios en mi computadora.', name: 'Question 12', type: 'type 12')
question13 = Question.create(number: 13, description: 'Si mi blog fuera temático, trataría acerca de:', name: 'Question 13', type: 'type 13')
question14 = Question.create(number: 14, description: 'Integraría un equipo de trabajo encargado de producir un audiovisual sobre:', name: 'Question 14', type: 'type 14')
question15 = Question.create(number: 15, description: 'Sería importante destacarme como:', name: 'Question 15', type: 'type 15')


#Choices
choice1Q1 = Choice.create(text: 'Si', question: question1)
choice2Q1 = Choice.create(text: 'No', question: question1)		
choice1Q2 = Choice.create(text: 'Si', question: question2)
choice2Q2 = Choice.create(text: 'No', question: question2)
choice1Q3 = Choice.create(text: 'Si', question: question3)
choice2Q3 = Choice.create(text: 'No', question: question3)
choice1Q4 = Choice.create(text: 'Si', question: question4)	
choice2Q4 = Choice.create(text: 'No', question: question4)
choice1Q5 = Choice.create(text: 'Si', question: question5)		
choice2Q5 = Choice.create(text: 'No', question: question5)
choice1Q6 = Choice.create(text: 'Si', question: question6)			
choice2Q6 = Choice.create(text: 'No', question: question6)
choice1Q7 = Choice.create(text: 'Si', question: question7)
choice2Q7 = Choice.create(text: 'No', question: question7)
choice1Q8 = Choice.create(text: 'Si', question: question8)
choice2Q8 = Choice.create(text: 'No', question: question8)
choice1Q9 = Choice.create(text: 'Si', question: question9)
choice2Q9 = Choice.create(text: 'No', question: question9)
choice1Q10 = Choice.create(text: 'Si', question: question10)
choice2Q10 = Choice.create(text: 'No', question: question10)
choice1Q11 = Choice.create(text: 'Si', question: question11)
choice2Q11 = Choice.create(text: 'No', question: question11)
choice1Q12 = Choice.create(text: 'Si', question: question12)
choice2Q12 = Choice.create(text: 'No', question: question12)
choice1Q13 = Choice.create(text: 'La importancia de la expresión artística en el desarrollo de la identidad de los pueblos.', question: question13)
choice2Q13 = Choice.create(text: 'La arquelogía urbana como forma de aprender acerca de la historia cultural de una ciudad.', question: question13)
choice3Q13 = Choice.create(text: ' La tecnología satelital en un proyecto para descubrir actividad volcánica para prevenir catástrofes climáticas.', question: question13)
choice4Q13 = Choice.create(text: 'Ninguna de las opciones.', question: question13)
choice1Q14 = Choice.create(text: ' La práctica de deportes y su influencia positiva en el estado de ánimo de las personas.', question: question14)
choice2Q14 = Choice.create(text: ' Los pensadores del siglo XX y su aporte a la gestión de las organizaciones.', question: question14)
choice3Q14 = Choice.create(text: 'Las mascotas y su incidencia en la calidad de vida de las personas no videntes.', question: question14)
choice4Q14 = Choice.create(text: 'El uso de la PC como herramienta para el control de los procesos industriales.', question: question14)
choice5Q14 = Choice.create(text: 'Procesos productivos de una empresa.', question: question14)
choice6Q14 = Choice.create(text: 'Ninguna de las opciones.', question: question14)
choice1Q15 = Choice.create(text: 'Director de una investigación técnico científica', question: question15)
choice2Q15 = Choice.create(text: 'Gerente general de una empresa reconocida por su responsabilidad social.', question: question15)
choice3Q15 = Choice.create(text: 'Un deportista famoso por su destreza física y su ética profesional.', question: question15)
choice4Q15 = Choice.create(text: 'Experto en la detección precoz de enfermedades neurológicas en niños.', question: question15)
choice5Q15 = Choice.create(text: 'Un agente de prensa audaz, número uno en el ranking de notas a celebridades', question: question15)
choice6Q15 = Choice.create(text: 'Ninguna de las opciones.', question: question15) 


#Create Outcomes
outcome1Q1 = Outcome.create(career: veterinaria, choice: choice1Q1);
outcome2Q1 = Outcome.create(career: agronomia, choice: choice1Q1);
outcome1Q2 = Outcome.create(career: fisica, choice: choice1Q2);
outcome2Q2 = Outcome.create(career: matematicas, choice: choice1Q2);
outcome3Q2 = Outcome.create(career: quimica, choice: choice1Q2);
outcome4Q2 = Outcome.create(career: computacion, choice: choice1Q2);
outcome1Q3 = Outcome.create(career: literatura, choice: choice1Q3);
outcome2Q3 = Outcome.create(career: historia, choice: choice1Q3);
outcome1Q4 = Outcome.create(career: fisica, choice: choice1Q4);
outcome1Q5 = Outcome.create(career: computacion, choice: choice1Q5);
outcome1Q6 = Outcome.create(career: arte, choice: choice1Q6);
outcome1Q7 = Outcome.create(career: historia, choice: choice1Q7);
outcome1Q8 = Outcome.create(career: literatura, choice: choice1Q8);
outcome2Q8 = Outcome.create(career: historia, choice: choice1Q8);
outcome1Q9 = Outcome.create(career: economia, choice: choice1Q9);
outcome1Q10 = Outcome.create(career: filosofia, choice: choice1Q10);
outcome2Q10 = Outcome.create(career: historia, choice: choice1Q10);
outcome1Q11 = Outcome.create(career: medicina, choice: choice1Q11);
outcome1Q12 = Outcome.create(career: computacion, choice: choice1Q12);
outcome2Q12 = Outcome.create(career: arquitectura, choice: choice1Q12);
outcome1Q13 = Outcome.create(career: sociologia, choice: choice1Q13);
outcome2Q13 = Outcome.create(career: historia, choice: choice2Q13);
outcome3Q13 = Outcome.create(career: geologia, choice: choice3Q13);
outcome1Q14 = Outcome.create(career: educacionFisica, choice: choice1Q14);
outcome2Q14 = Outcome.create(career: filosofia, choice: choice2Q14);
outcome3Q14 = Outcome.create(career: historia, choice: choice2Q14);
outcome4Q14 = Outcome.create(career: veterinaria, choice: choice3Q14);
outcome5Q14 = Outcome.create(career: computacion, choice: choice4Q14);
outcome6Q14 = Outcome.create(career: economia, choice: choice5Q14);
outcome1Q15 = Outcome.create(career: fisica, choice: choice1Q15);
outcome2Q15 = Outcome.create(career: quimica, choice: choice1Q15);
outcome3Q15 = Outcome.create(career: computacion, choice: choice1Q15);
outcome4Q15 = Outcome.create(career: economia, choice: choice2Q15);
outcome5Q15 = Outcome.create(career: educacionFisica, choice: choice3Q15);
outcome6Q15 = Outcome.create(career: medicina, choice: choice4Q15);
outcome7Q15 = Outcome.create(career: periodismo, choice: choice5Q15);


#Create Surveys
Survey.create(username: 'Nicolas', career: economia )
Survey.create(username: 'Agustin', career: computacion)
Survey.create(username: 'Joaquin', career: fisica)