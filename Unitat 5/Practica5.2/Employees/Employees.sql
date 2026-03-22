SELECT employeeNumber ,lastName ,firstName ,extension ,email ,reportsTo ,jobTitle,

officeCode ofCode,city ofCity, phone ofPhone,addressLine1  ofAdd1, addressLine2 ofAdd2,state ofState ,country ofCountry ,postalCode ofPostalCode ,territory ofTerritory

FROM classicmodels.employees emp JOIN classicmodels.offices ofi using (officeCode);