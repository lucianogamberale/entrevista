!classDefinition: #PersonaVinculadaAFacultadTest category: 'Entrevista'!
TestCase subclass: #PersonaVinculadaAFacultadTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Entrevista'!

!PersonaVinculadaAFacultadTest methodsFor: 'as yet unclassified' stamp: 'LMG 6/19/2022 19:49:28'!
test01CambioElEstadoCivilDeUnEstudianteDeSolteroACasado

	| estudiante |
	
	estudiante := Estudiante 
						llamado: 'Alumno' 
						conIdentificacion: 00000 
						estadoCivil: 'Soltero' 
						inscriptoEn: 'Materia1'.
						
	estudiante cambiarEstadoCivilA: 'Casado'.
	
	self assert: (estudiante suEstadoCivilEs: 'Casado').
	self assert: (estudiante seLlama: 'Alumno').
	self assert: (estudiante tieneIdentificacion: 00000).
	! !

!PersonaVinculadaAFacultadTest methodsFor: 'as yet unclassified' stamp: 'LMG 6/19/2022 19:49:48'!
test02CambioElEstadoCivilDeUnProfesorDeSolteroACasado

	| profesor |

	profesor := Profesor 
						llamado: 'Profesor' 
						conIdentificacion: 11111 
						estadoCivil: 'Soltero' 
						incorporadoEn: 2020 
						enElDespacho: 1
						enDepartamentoDe: 'Departamento'.
						
	profesor cambiarEstadoCivilA: 'Casado'.
	
	self assert: (profesor suEstadoCivilEs: 'Casado').
	self assert: (profesor seLlama: 'Profesor').
	self assert: (profesor tieneIdentificacion: 11111).! !

!PersonaVinculadaAFacultadTest methodsFor: 'as yet unclassified' stamp: 'LMG 6/19/2022 19:50:19'!
test03CambioElEstadoCivilDeUnPesonalDeServicioDeSolteroACasado

	| personalDeServicio |

	personalDeServicio := PersonalDeServicio 
										llamado: 'Personal' 
										conIdentificacion: 22222 
										estadoCivil: 'Soltero' 
										incorporadoEn: 2020 
										enElDespacho: 1 
										enSeccion: 'Seccion1'.

	personalDeServicio cambiarEstadoCivilA: 'Casado'.
	
	self assert: (personalDeServicio suEstadoCivilEs: 'Casado').
	self assert: (personalDeServicio seLlama: 'Personal').
	self assert: (personalDeServicio tieneIdentificacion: 22222).! !

!PersonaVinculadaAFacultadTest methodsFor: 'as yet unclassified' stamp: 'LMG 6/19/2022 19:50:29'!
test04CambioElEstadoCivilDeUnaPersonaErroneamente

	| personalDeServicio |

	personalDeServicio := PersonalDeServicio 
										llamado: 'Personal' 
										conIdentificacion: 22222 
										estadoCivil: 'Soltero' 
										incorporadoEn: 2020 
										enElDespacho: 1 
										enSeccion: 'Seccion1'.
	self
		should: [personalDeServicio cambiarEstadoCivilA: 'Invalido'.]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self 
				assert: anError messageText 
				equals: personalDeServicio textoErrorAlCambiarQuererCambiarAUnEstadoCivilInvalido .
		].
	! !


!classDefinition: #SistemaGestionDeFacultadTest category: 'Entrevista'!
TestCase subclass: #SistemaGestionDeFacultadTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Entrevista'!

!SistemaGestionDeFacultadTest methodsFor: 'as yet unclassified' stamp: 'LMG 6/19/2022 19:38:14'!
test01UnSistemaDeGestionDeFacultadCuandoSeCreaNoContienePersonas

	| sistemaGestionDeFacultad |
	
	sistemaGestionDeFacultad := SistemaGestionDeFacultad new.
	
	self deny: sistemaGestionDeFacultad contienePersonas! !

!SistemaGestionDeFacultadTest methodsFor: 'as yet unclassified' stamp: 'LMG 6/19/2022 19:38:21'!
test02AgregoUnEstudianteAlSistemaDeGestionDeFacultad

	| sistemaGestionDeFacultad estudiante |
	
	sistemaGestionDeFacultad := SistemaGestionDeFacultad new.
	
	estudiante := Estudiante 
						llamado: 'Alumno1' 
						conIdentificacion: 00000 
						estadoCivil: 'Soltero' 
						inscriptoEn: 'Materia1'.
	
	sistemaGestionDeFacultad agregar: estudiante.
	
	self assert: sistemaGestionDeFacultad contienePersonas.
	self assert: (sistemaGestionDeFacultad contieneA: 'Alumno1' conIdentificacion: 00000).! !

!SistemaGestionDeFacultadTest methodsFor: 'as yet unclassified' stamp: 'LMG 6/19/2022 19:38:49'!
test03AgregoUnProfesorAlSistemaDeGestionDeFacultad

	| sistemaGestionDeFacultad profesor |
	
	sistemaGestionDeFacultad := SistemaGestionDeFacultad new.
	
	profesor := Profesor 
						llamado: 'Profesor1' 
						conIdentificacion: 11111 
						estadoCivil: 'Soltero' 
						incorporadoEn: 2020
						enElDespacho: 1 
						enDepartamentoDe: 'Departamento'.
						
	sistemaGestionDeFacultad agregar: profesor.
	
	self assert: sistemaGestionDeFacultad contienePersonas.
	self assert: (sistemaGestionDeFacultad contieneA: 'Profesor1' conIdentificacion: 11111).! !

!SistemaGestionDeFacultadTest methodsFor: 'as yet unclassified' stamp: 'LMG 6/19/2022 19:38:57'!
test04AgregoUnPersonalDeServicioAlSistemaDeGestionDeFacultad

	| sistemaGestionDeFacultad personalDeServicio |
	
	sistemaGestionDeFacultad := SistemaGestionDeFacultad new.
	
	personalDeServicio := PersonalDeServicio 
										llamado: 'Personal' 
										conIdentificacion: 22222 
										estadoCivil: 'Soltero' 
										incorporadoEn: 2020 
										enElDespacho: 1 
										enSeccion: 'Seccion1'.
	
	sistemaGestionDeFacultad agregar: personalDeServicio.
	
	self assert: sistemaGestionDeFacultad contienePersonas.
	self assert: (sistemaGestionDeFacultad contieneA: 'Personal' conIdentificacion: 22222).! !

!SistemaGestionDeFacultadTest methodsFor: 'as yet unclassified' stamp: 'LMG 6/19/2022 19:39:04'!
test05AgregoVariasPersonasAlSistemaDeFacultad

	| sistemaGestionDeFacultad personalDeServicio estudiante profesor |
	
	sistemaGestionDeFacultad := SistemaGestionDeFacultad new.
	
	estudiante := Estudiante 
						llamado: 'Alumno1' 
						conIdentificacion: 00000 
						estadoCivil: 'Soltero' 
						inscriptoEn: 'Materia1'.
						
	profesor := Profesor 
						llamado: 'Profesor1' 
						conIdentificacion: 11111 
						estadoCivil: 'Soltero' 
						incorporadoEn: 2020
						enElDespacho: 1 
						enDepartamentoDe: 'Departamento'.
						
	personalDeServicio := PersonalDeServicio 
										llamado: 'Personal' 
										conIdentificacion: 22222 
										estadoCivil: 'Soltero' 
										incorporadoEn: 2020 
										enElDespacho: 1 
										enSeccion: 'Seccion1'.
	
	sistemaGestionDeFacultad agregar: estudiante.
	sistemaGestionDeFacultad agregar: profesor.
	sistemaGestionDeFacultad agregar: personalDeServicio.
	
	self assert: sistemaGestionDeFacultad contienePersonas.
	self assert: (sistemaGestionDeFacultad contieneA: 'Alumno1' conIdentificacion: 00000).
	self assert: (sistemaGestionDeFacultad contieneA: 'Profesor1' conIdentificacion: 11111).
	self assert: (sistemaGestionDeFacultad contieneA: 'Personal' conIdentificacion: 22222).
	
	
	! !

!SistemaGestionDeFacultadTest methodsFor: 'as yet unclassified' stamp: 'LMG 6/19/2022 19:47:16'!
test06AgregoPersonasInvalidasAlSistemaDeFacultad

	| sistemaGestionDeFacultad personalDeServicio estudiante profesor |
	
	sistemaGestionDeFacultad := SistemaGestionDeFacultad new.
	
	estudiante := Estudiante 
						llamado: 'Alumno1' 
						conIdentificacion: 00000 
						estadoCivil: 'Soltero' 
						inscriptoEn: 'Materia1'.
						
	profesor := Profesor 
						llamado: 'Profesor1' 
						conIdentificacion: 11111 
						estadoCivil: 'Soltero' 
						incorporadoEn: 2020
						enElDespacho: 1 
						enDepartamentoDe: 'Departamento'.
						
	personalDeServicio := PersonalDeServicio 
										llamado: 'Personal' 
										conIdentificacion: 22222 
										estadoCivil: 'Soltero' 
										incorporadoEn: 2020 
										enElDespacho: 1 
										enSeccion: 'Seccion1'.
	
	sistemaGestionDeFacultad agregar: estudiante.
	sistemaGestionDeFacultad agregar: profesor.
	sistemaGestionDeFacultad agregar: personalDeServicio.
	
	self
		should: [sistemaGestionDeFacultad agregar: #PersonaInvalida.]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self 
				assert: anError messageText 
				equals: sistemaGestionDeFacultad textoErrorAlQuererIngresarPersonaNoPertenecienteALaFacultad.
		].
	
	
	! !

!SistemaGestionDeFacultadTest methodsFor: 'as yet unclassified' stamp: 'LMG 6/19/2022 19:40:16'!
test07ModificoElEstadoCivilDeUnaPersonaQueSeEncuentraEnElSistemaDeGestionDeFacultad

	| sistemaGestionDeFacultad personalDeServicio estudiante profesor |
	
	sistemaGestionDeFacultad := SistemaGestionDeFacultad new.
	
	estudiante := Estudiante 
						llamado: 'Alumno1' 
						conIdentificacion: 00000 
						estadoCivil: 'Soltero' 
						inscriptoEn: 'Materia1'.
	
	profesor := Profesor 
						llamado: 'Profesor1' 
						conIdentificacion: 11111 
						estadoCivil: 'Soltero' 
						incorporadoEn: 2020
						enElDespacho: 1 
						enDepartamentoDe: 'Departamento'.
	
	personalDeServicio := PersonalDeServicio 
										llamado: 'Personal' 
										conIdentificacion: 22222 
										estadoCivil: 'Soltero' 
										incorporadoEn: 2020 
										enElDespacho: 1 
										enSeccion: 'Seccion1'.
	
	sistemaGestionDeFacultad agregar: estudiante.
	sistemaGestionDeFacultad agregar: profesor.
	sistemaGestionDeFacultad agregar: personalDeServicio.
	
	sistemaGestionDeFacultad cambiarEstadoCivilA: 'Casado' deUnaPersonaLlamada: 'Profesor1' conIdentificacion: 11111.
	
	self assert: (sistemaGestionDeFacultad contieneA: 'Profesor1' conIdentificacion: 11111).
	self assert: (sistemaGestionDeFacultad esta: 'Casado' laPersonaLlamada: 'Profesor1' conIdetificacion: 11111).
	self deny: (sistemaGestionDeFacultad esta: 'Soltero' laPersonaLlamada: 'Profesor1' conIdetificacion: 11111).
	
	! !

!SistemaGestionDeFacultadTest methodsFor: 'as yet unclassified' stamp: 'LMG 6/19/2022 19:40:29'!
test08MatriculoAUnNuevoCursoAUnAlumnoEncuentraEnElSistemaDeGestionDeFacultad

	| sistemaGestionDeFacultad personalDeServicio estudiante profesor |
	
	sistemaGestionDeFacultad := SistemaGestionDeFacultad new.
	
	estudiante := Estudiante 
						llamado: 'Alumno1' 
						conIdentificacion: 00000 
						estadoCivil: 'Soltero' 
						inscriptoEn: 'Materia1'.
						
	profesor := Profesor 
						llamado: 'Profesor1' 
						conIdentificacion: 11111 
						estadoCivil: 'Soltero' 
						incorporadoEn: 2020
						enElDespacho: 1 
						enDepartamentoDe: 'Departamento'.
	
	personalDeServicio := PersonalDeServicio 
										llamado: 'Personal' 
										conIdentificacion: 22222 
										estadoCivil: 'Soltero' 
										incorporadoEn: 2020 
										enElDespacho: 1 
										enSeccion: 'Seccion1'.
	
	sistemaGestionDeFacultad agregar: estudiante.
	sistemaGestionDeFacultad agregar: profesor.
	sistemaGestionDeFacultad agregar: personalDeServicio.
	
	sistemaGestionDeFacultad matricularEn: 'Materia2' elAlumnoLlamado: 'Alumno1' conIdentificacion: 00000.
	
	self assert: (sistemaGestionDeFacultad contieneA: 'Alumno1' conIdentificacion: 00000).
	self assert: (sistemaGestionDeFacultad estaMatriculadoEn: 'Materia2' elAlumnoLlamado: 'Alumno1' conIdentificacion: 00000).
	self deny: (sistemaGestionDeFacultad estaMatriculadoEn: 'Materia1' elAlumnoLlamado: 'Alumno1' conIdentificacion: 00000).
	
	
	! !

!SistemaGestionDeFacultadTest methodsFor: 'as yet unclassified' stamp: 'LMG 6/19/2022 19:40:42'!
test09CambioDeDepartamentoAUnProfesorQueSeEncuentraEnElSistemaDeGestionDeFacultad

	| sistemaGestionDeFacultad personalDeServicio estudiante profesor |
	
	sistemaGestionDeFacultad := SistemaGestionDeFacultad new.
	
	estudiante := Estudiante 
						llamado: 'Alumno1' 
						conIdentificacion: 00000 
						estadoCivil: 'Soltero' 
						inscriptoEn: 'Materia1'.
						
	profesor := Profesor 
						llamado: 'Profesor1' 
						conIdentificacion: 11111 
						estadoCivil: 'Soltero' 
						incorporadoEn: 2020
						enElDespacho: 1 
						enDepartamentoDe: 'Departamento'.
						
	personalDeServicio := PersonalDeServicio 
										llamado: 'Personal' 
										conIdentificacion: 22222 
										estadoCivil: 'Soltero' 
										incorporadoEn: 2020 
										enElDespacho: 1 
										enSeccion: 'Seccion1'.
	
	sistemaGestionDeFacultad agregar: estudiante.
	sistemaGestionDeFacultad agregar: profesor.
	sistemaGestionDeFacultad agregar: personalDeServicio.
	
	sistemaGestionDeFacultad cambiarADepartamento: 'Departamento2' alProfesorLlamado: 'Profesor1' conIdentificacion: 11111.
	
	self assert: (sistemaGestionDeFacultad contieneA: 'Profesor1' conIdentificacion: 11111).
	self assert: (sistemaGestionDeFacultad estaEnDepartamento: 'Departamento2' elProfesorLlamado: 'Profesor1' conIdentificacion: 11111).
	self deny: (sistemaGestionDeFacultad estaEnDepartamento: 'Departamento1' elProfesorLlamado: 'Profesor1' conIdentificacion: 11111).
	
	
	! !

!SistemaGestionDeFacultadTest methodsFor: 'as yet unclassified' stamp: 'LMG 6/19/2022 19:39:53'!
test10TrasladoDeSeccionAUnPersonalDeServicioQueSeEncuentraEnElSistemaDeGestionDeFacultad

	| sistemaGestionDeFacultad personalDeServicio estudiante profesor |
	
	sistemaGestionDeFacultad := SistemaGestionDeFacultad new.
	
	estudiante := Estudiante 
						llamado: 'Alumno1' 
						conIdentificacion: 00000 
						estadoCivil: 'Soltero' 
						inscriptoEn: 'Materia1'.
						
	profesor := Profesor 
						llamado: 'Profesor1' 
						conIdentificacion: 11111 
						estadoCivil: 'Soltero' 
						incorporadoEn: 2020
						enElDespacho: 1 
						enDepartamentoDe: 'Departamento'.
						
	personalDeServicio := PersonalDeServicio 
										llamado: 'Personal' 
										conIdentificacion: 22222 
										estadoCivil: 'Soltero' 
										incorporadoEn: 2020 
										enElDespacho: 1 
										enSeccion: 'Seccion1'.
	
	sistemaGestionDeFacultad agregar: estudiante.
	sistemaGestionDeFacultad agregar: profesor.
	sistemaGestionDeFacultad agregar: personalDeServicio.
	
	sistemaGestionDeFacultad cambiarASeccion: 'Seccion2' alPersonalDeServicioLlamado: 'Personal' conIdentificacion: 22222.
	
	self assert: (sistemaGestionDeFacultad contieneA: 'Personal' conIdentificacion: 22222).
	self assert: (sistemaGestionDeFacultad estaEnSeccion: 'Seccion2' elPersonalDeServicioLlamado: 'Personal' conIdentificacion: 22222).
	self deny: (sistemaGestionDeFacultad estaEnSeccion: 'Seccion1' elPersonalDeServicioLlamado: 'Personal' conIdentificacion: 22222).
	
	! !

!SistemaGestionDeFacultadTest methodsFor: 'as yet unclassified' stamp: 'LMG 6/19/2022 19:37:56'!
test11ObtengoTodosLosProfesoresQueSeEncuentraUnDepartamentoEnParticular

	| sistemaGestionDeFacultad profesor1 profesor2 profesor3 profesoresObtenidos profesoresEsperados |
	
	sistemaGestionDeFacultad := SistemaGestionDeFacultad new.
	
	profesor1 := Profesor 
						llamado: 'Profesor1' 
						conIdentificacion: 11111 
						estadoCivil: 'Soltero' 
						incorporadoEn: 2020
						enElDespacho: 1 
						enDepartamentoDe: 'Departamento1'.
						
	profesor2 := Profesor 
						llamado: 'Profesor2' 
						conIdentificacion: 11112
						estadoCivil: 'Soltero' 
						incorporadoEn: 2020
						enElDespacho: 1 
						enDepartamentoDe: 'Departamento1'.
						
	profesor3 := Profesor 
						llamado: 'Profesor3' 
						conIdentificacion: 11113 
						estadoCivil: 'Soltero' 
						incorporadoEn: 2020
						enElDespacho: 1 
						enDepartamentoDe: 'Departamento2'.
						
	sistemaGestionDeFacultad agregar: profesor1.
	sistemaGestionDeFacultad agregar: profesor2.
	sistemaGestionDeFacultad agregar: profesor3.
	
	profesoresObtenidos := sistemaGestionDeFacultad obtenerProfesoresPertenecientesADepartamento: 'Departamento1'.
	profesoresEsperados := OrderedCollection with: profesor1 with: profesor2.
	
	self assert: profesoresEsperados equals: profesoresObtenidos.
	
	! !

!SistemaGestionDeFacultadTest methodsFor: 'as yet unclassified' stamp: 'LMG 6/19/2022 19:35:38'!
test12ObtengoTodosLosAlumnosPertenecientesAUnCursoEnParticular

	| sistemaGestionDeFacultad alumnosObtenidos alumnosEsperados estudiante1 estudiante2 estudiante3 |
	
	sistemaGestionDeFacultad := SistemaGestionDeFacultad new.
	
	estudiante1 := Estudiante 
						llamado: 'Alumno1' 
						conIdentificacion: 00000 
						estadoCivil: 'Soltero' 
						inscriptoEn: 'Materia1'.
						
	estudiante2 := Estudiante 
						llamado: 'Alumno2' 
						conIdentificacion: 00001 
						estadoCivil: 'Soltero' 
						inscriptoEn: 'Materia1'.
						
	estudiante3 := Estudiante 
						llamado: 'Alumno3' 
						conIdentificacion: 00002
						estadoCivil: 'Soltero' 
						inscriptoEn: 'Materia2'.
	
	sistemaGestionDeFacultad agregar: estudiante1.
	sistemaGestionDeFacultad agregar: estudiante2.
	sistemaGestionDeFacultad agregar: estudiante3.
	
	alumnosObtenidos := sistemaGestionDeFacultad obtenerEstudiantesPertenecientesAlCurso: 'Materia1'.
	alumnosEsperados := OrderedCollection with: estudiante1 with: estudiante2.
	
	self assert: alumnosEsperados equals: alumnosObtenidos.
	
	! !


!classDefinition: #PersonaVinculadaAFacultad category: 'Entrevista'!
Object subclass: #PersonaVinculadaAFacultad
	instanceVariableNames: 'nombre numeroDeIdentificacion estadoCivil'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Entrevista'!

!PersonaVinculadaAFacultad methodsFor: 'as yet unclassified' stamp: 'LMG 6/19/2022 19:54:28'!
cambiarEstadoCivilA: unEstadoCivil 
	
	((unEstadoCivil = 'Casado') or: [unEstadoCivil = 'Soltero']) ifTrue: [
		^ estadoCivil := unEstadoCivil 
	].

	self error: self textoErrorAlCambiarQuererCambiarAUnEstadoCivilInvalido.

	! !

!PersonaVinculadaAFacultad methodsFor: 'as yet unclassified' stamp: 'LMG 6/18/2022 14:27:45'!
seLlama: unNombre
	^ (nombre = unNombre)! !

!PersonaVinculadaAFacultad methodsFor: 'as yet unclassified' stamp: 'LMG 6/19/2022 19:01:51'!
seLlama: unNombreDePersona yTieneIdentificacion: unaIdentificacion
	^ ((self seLlama: unNombreDePersona) and: [self tieneIdentificacion: unaIdentificacion])! !

!PersonaVinculadaAFacultad methodsFor: 'as yet unclassified' stamp: 'LMG 6/19/2022 17:58:22'!
suEstadoCivilEs: unEstadoCivil
	^ (estadoCivil = unEstadoCivil)! !

!PersonaVinculadaAFacultad methodsFor: 'as yet unclassified' stamp: 'LMG 6/19/2022 19:48:29'!
textoErrorAlCambiarQuererCambiarAUnEstadoCivilInvalido
	^ 'El estado civil ingresado es invalido.'! !

!PersonaVinculadaAFacultad methodsFor: 'as yet unclassified' stamp: 'LMG 6/18/2022 14:27:55'!
tieneIdentificacion: unaIdentificacion
	^ (numeroDeIdentificacion = unaIdentificacion) ! !


!classDefinition: #Empleado category: 'Entrevista'!
PersonaVinculadaAFacultad subclass: #Empleado
	instanceVariableNames: 'añoDeIncorporacion numeroDeDespacho'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Entrevista'!


!classDefinition: #PersonalDeServicio category: 'Entrevista'!
Empleado subclass: #PersonalDeServicio
	instanceVariableNames: 'seccion'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Entrevista'!

!PersonalDeServicio methodsFor: 'as yet unclassified' stamp: 'LMG 6/19/2022 18:14:47'!
cambiarASeccion: unaNuevaSeccion
	seccion := unaNuevaSeccion ! !

!PersonalDeServicio methodsFor: 'as yet unclassified' stamp: 'LMG 6/19/2022 18:13:53'!
estaEnSeccion: unaSeccion
	^ (seccion = unaSeccion)! !

!PersonalDeServicio methodsFor: 'as yet unclassified' stamp: 'LMG 6/18/2022 14:50:10'!
incializarConNombre: unNombre conIdentificacion: unaIdentificacion estadoCivil: unEstadoCivil incorporadoEn: unAño enElDespacho: unNumeroDeDespacho enSeccion: unaSeccion
	nombre := unNombre. 
	numeroDeIdentificacion := unaIdentificacion.
	estadoCivil := unEstadoCivil.
	añoDeIncorporacion := unAño.
	numeroDeDespacho := unNumeroDeDespacho.
	seccion := unaSeccion.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PersonalDeServicio class' category: 'Entrevista'!
PersonalDeServicio class
	instanceVariableNames: ''!

!PersonalDeServicio class methodsFor: 'as yet unclassified' stamp: 'LMG 6/18/2022 14:49:28'!
llamado: unNombre conIdentificacion: unaIdentificacion estadoCivil: unEstadoCivil incorporadoEn: unAño enElDespacho: unNumeroDeDespacho enSeccion: unaSeccion 
	^ self new incializarConNombre: unNombre conIdentificacion: unaIdentificacion estadoCivil: unEstadoCivil incorporadoEn: unAño enElDespacho: unNumeroDeDespacho enSeccion: unaSeccion.! !


!classDefinition: #Profesor category: 'Entrevista'!
Empleado subclass: #Profesor
	instanceVariableNames: 'departamento'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Entrevista'!

!Profesor methodsFor: 'as yet unclassified' stamp: 'LMG 6/19/2022 18:05:26'!
cambiarADepartamento: unNuevoDepartamento
	departamento := unNuevoDepartamento ! !

!Profesor methodsFor: 'as yet unclassified' stamp: 'LMG 6/19/2022 18:06:35'!
estaEnDepartamento: unDepartamento
	^ (departamento = unDepartamento)! !

!Profesor methodsFor: 'as yet unclassified' stamp: 'LMG 6/18/2022 14:46:01'!
incializarConNombre: unNombre conIdentificacion: unaIdentificacion estadoCivil: unEstadoCivil incorporadoEn: unAño enElDespacho: unNumeroDeDespacho enDepartamentoDe: unDepartamento
	nombre := unNombre. 
	numeroDeIdentificacion := unaIdentificacion.
	estadoCivil := unEstadoCivil.
	añoDeIncorporacion := unAño.
	numeroDeDespacho := unNumeroDeDespacho.
	departamento := unDepartamento.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Profesor class' category: 'Entrevista'!
Profesor class
	instanceVariableNames: ''!

!Profesor class methodsFor: 'as yet unclassified' stamp: 'LMG 6/18/2022 14:46:16'!
llamado: unNombre conIdentificacion: unaIdentificacion estadoCivil: unEstadoCivil incorporadoEn: unAño enElDespacho: unNumeroDeDespacho enDepartamentoDe: unDepartamento 
	^ self new incializarConNombre: unNombre conIdentificacion: unaIdentificacion estadoCivil: unEstadoCivil incorporadoEn: unAño enElDespacho: unNumeroDeDespacho enDepartamentoDe: unDepartamento.! !


!classDefinition: #Estudiante category: 'Entrevista'!
PersonaVinculadaAFacultad subclass: #Estudiante
	instanceVariableNames: 'curso'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Entrevista'!

!Estudiante methodsFor: 'as yet unclassified' stamp: 'LMG 6/19/2022 17:49:34'!
estaMatriculadoEn: unCurso 
	^ curso = unCurso ! !

!Estudiante methodsFor: 'as yet unclassified' stamp: 'LMG 6/17/2022 12:08:09'!
inicializarConNombre: unNombre identificacion: unaIdentificacion estadoCivil: unEstadoCivil insciptoEn: unCurso 
	nombre := unNombre.
	numeroDeIdentificacion := unaIdentificacion.
	estadoCivil := unEstadoCivil.
	curso := unCurso! !

!Estudiante methodsFor: 'as yet unclassified' stamp: 'LMG 6/19/2022 17:47:35'!
matricularEn: unNuevoCurso 
	curso := unNuevoCurso ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Estudiante class' category: 'Entrevista'!
Estudiante class
	instanceVariableNames: ''!

!Estudiante class methodsFor: 'as yet unclassified' stamp: 'LMG 6/17/2022 11:38:08'!
llamado: unNombre conIdentificacion: unaIdentificacion estadoCivil: unEstadoCivil inscriptoEn: unCurso 
	^self new inicializarConNombre: unNombre identificacion: unaIdentificacion estadoCivil: unEstadoCivil insciptoEn: unCurso! !


!classDefinition: #SistemaGestionDeFacultad category: 'Entrevista'!
Object subclass: #SistemaGestionDeFacultad
	instanceVariableNames: 'personas'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Entrevista'!

!SistemaGestionDeFacultad methodsFor: 'as yet unclassified' stamp: 'LMG 6/19/2022 19:29:18'!
agregar: unaPersona 
	(unaPersona isKindOf: PersonaVinculadaAFacultad) ifTrue: [		^ personas add: unaPersona	].
	self error: self textoErrorAlQuererIngresarPersonaNoPertenecienteALaFacultad ! !

!SistemaGestionDeFacultad methodsFor: 'as yet unclassified' stamp: 'LMG 6/19/2022 19:05:16'!
cambiarADepartamento: unNuevoDepartamento alProfesorLlamado: unNombreDeProfesor conIdentificacion: unaIdentificacion 
	personas do: [: persona | 
		((persona isKindOf: Profesor) 
			and: [persona seLlama: unNombreDeProfesor yTieneIdentificacion: unaIdentificacion ]) 
				ifTrue: [persona cambiarADepartamento: unNuevoDepartamento]
	].! !

!SistemaGestionDeFacultad methodsFor: 'as yet unclassified' stamp: 'LMG 6/19/2022 19:05:19'!
cambiarASeccion: unaNuevaSeccion alPersonalDeServicioLlamado: unNombre conIdentificacion: unaIdentificacion 
	personas do: [: persona | 
		((persona isKindOf: PersonalDeServicio) 
			and: [persona seLlama: unNombre yTieneIdentificacion: unaIdentificacion])
				ifTrue: [persona cambiarASeccion: unaNuevaSeccion]
	].! !

!SistemaGestionDeFacultad methodsFor: 'as yet unclassified' stamp: 'LMG 6/19/2022 19:01:02'!
cambiarEstadoCivilA: unEstadoCivil deUnaPersonaLlamada: unNombreDeUnaPersona conIdentificacion: unaIdentificacion 
	personas do: [: persona | 
		(persona seLlama: unNombreDeUnaPersona yTieneIdentificacion: unaIdentificacion) 
			ifTrue: [persona cambiarEstadoCivilA: unEstadoCivil]
	].! !

!SistemaGestionDeFacultad methodsFor: 'as yet unclassified' stamp: 'LMG 6/19/2022 19:02:14'!
contieneA: unNombreDeUnaPersona conIdentificacion: unaIdentificacion 
	^ personas anySatisfy: [: persona | 
		persona seLlama: unNombreDeUnaPersona yTieneIdentificacion: unaIdentificacion 
	]! !

!SistemaGestionDeFacultad methodsFor: 'as yet unclassified' stamp: 'LMG 6/17/2022 12:01:54'!
contienePersonas
	^ personas isEmpty not! !

!SistemaGestionDeFacultad methodsFor: 'as yet unclassified' stamp: 'LMG 6/19/2022 19:05:30'!
esta: unEstadoCivil laPersonaLlamada: unNombreDeUnaPersona conIdetificacion: unaIdentificacion 
	^ personas anySatisfy: [: persona | 
		(persona seLlama: unNombreDeUnaPersona yTieneIdentificacion: unaIdentificacion) 
			and: [persona suEstadoCivilEs: unEstadoCivil]]! !

!SistemaGestionDeFacultad methodsFor: 'as yet unclassified' stamp: 'LMG 6/19/2022 19:05:39'!
estaEnDepartamento: unDepartamento elProfesorLlamado: unNombreDeProfesor conIdentificacion: unaIdentificacion 
	^ personas anySatisfy: [: persona | 
		((persona isKindOf: Profesor) 
			and: [persona seLlama: unNombreDeProfesor yTieneIdentificacion: unaIdentificacion]) 
				and: [persona estaEnDepartamento: unDepartamento]
	].! !

!SistemaGestionDeFacultad methodsFor: 'as yet unclassified' stamp: 'LMG 6/19/2022 19:05:43'!
estaEnSeccion: unaSeccion elPersonalDeServicioLlamado: unNombre conIdentificacion: unaIdentificacion 
	^ personas anySatisfy: [: persona | 
		((persona isKindOf: PersonalDeServicio) 
			and: [persona seLlama: unNombre yTieneIdentificacion: unaIdentificacion ]) 
				and: [persona estaEnSeccion: unaSeccion]
	].! !

!SistemaGestionDeFacultad methodsFor: 'as yet unclassified' stamp: 'LMG 6/19/2022 19:05:46'!
estaMatriculadoEn: unCurso elAlumnoLlamado: unNombreDeUnAlumno conIdentificacion: unaIdentificacion 
	^ personas anySatisfy: [: persona | 
		((persona isKindOf: Estudiante) 
			and: [persona seLlama: unNombreDeUnAlumno yTieneIdentificacion: unaIdentificacion]) 
				and: [persona estaMatriculadoEn: unCurso]
	].! !

!SistemaGestionDeFacultad methodsFor: 'as yet unclassified' stamp: 'LMG 6/17/2022 12:01:29'!
initialize
	personas := OrderedCollection new.! !

!SistemaGestionDeFacultad methodsFor: 'as yet unclassified' stamp: 'LMG 6/19/2022 19:05:02'!
matricularEn: unNuevoCurso elAlumnoLlamado: unNombreDeUnAlumno conIdentificacion: unaIdentificacion 
	personas do: [: persona | 
		((persona isKindOf: Estudiante) 
			and: [persona seLlama: unNombreDeUnAlumno yTieneIdentificacion: unaIdentificacion]) 
				ifTrue: [persona matricularEn: unNuevoCurso]
	].! !

!SistemaGestionDeFacultad methodsFor: 'as yet unclassified' stamp: 'LMG 6/19/2022 19:20:39'!
obtenerEstudiantesPertenecientesAlCurso: unCurso

	| estudiantesDelCurso |
	
	estudiantesDelCurso := OrderedCollection new.
	
	personas do: [: persona | 
		((persona isKindOf: Estudiante) and: [persona estaMatriculadoEn: unCurso]) ifTrue: [estudiantesDelCurso add: persona]
	].

	^ estudiantesDelCurso ! !

!SistemaGestionDeFacultad methodsFor: 'as yet unclassified' stamp: 'LMG 6/19/2022 18:27:49'!
obtenerProfesoresPertenecientesADepartamento: unDepartamento 
	
	| profesoresDelDepto |
	
	profesoresDelDepto := OrderedCollection new.
	
	personas do: [: persona | 
		((persona isKindOf: Profesor) and: [persona estaEnDepartamento: unDepartamento]) ifTrue: [profesoresDelDepto add: persona]
	].

	^ profesoresDelDepto ! !

!SistemaGestionDeFacultad methodsFor: 'as yet unclassified' stamp: 'LMG 6/19/2022 19:29:18'!
textoErrorAlQuererIngresarPersonaNoPertenecienteALaFacultad
	^ ''! !
