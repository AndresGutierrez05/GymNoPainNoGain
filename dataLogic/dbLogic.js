const rest = new (require('rest-mssql-nodejs'))({
    user: process.env.USERBD,
    password: process.env.USERBDPASSWORD,
    server: process.env.SERVER,
    database: process.env.DATABASENAME,
    options: { 
        encrypt: true
    }
}); 

const LogIn = async ({ email, password }) => {
    const result = await rest.executeQuery(
        `select * from Users Where Email = '${ email.trim() }' And Password = '${ password.trim() } IdRol = 1 '`
    );
    if(!result.success)
        return { error : result.errorDetail }

    return result.success;
}

const RegisterUser = async ({ firstName, lastName, IdSite, email, password, idGenre }) => {
    const validateIfExistsUsers = await rest.executeQuery(
        `Select Count(Id) As countUsers From Users Where Email = '${ email.trim() }' `
    );
    if(!validateIfExistsUsers.success)
        return { error : validateIfExistsUsers.errorDetail }

    const validateCountUsersInSite = await rest.executeQuery(
        `Select Count(US.id) As countUsersInSite From Users As US
            Inner join Sites As SI On US.IdSite = SI.Id
            Where Si.Id = ${ IdSite }`
    );
    if(!validateCountUsersInSite.success)
        return { error : validateIfExistsUsers.errorDetail }

    if(validateCountUsersInSite.data[0][0].countUsersInSite >= process.env.MAXIMUMCOUNTUSERINASITE)
        return { message : "Maximum capacity reached of users in this site" }
    
    let result;
    if(validateIfExistsUsers.data[0][0].countUsers === 0){
        result = await rest.executeQuery(
            `Insert Into Users Values
                ('${ firstName.trim() }'
                ,'${ lastName.trim() }'
                ,2
                ,${ IdSite }
                ,'${ email.trim() }'
                ,'${ password.trim() }'
                ,${ idGenre })`
        );
    }
    else
        return { message : "There exists a user with this email" };

    if(!result.success)
        return { error : result.errorDetail }

    return { message : "You registration has been sucessful" };
}


const RegisterCity = async ({ city }) => {
    const validateIfExists = await rest.executeQuery(
        `Select Count(Id) As countCities From Cities Where City = '${ city.trim() }'`
    );
    if(!validateIfExists.success)
        return { error : validateIfExists.errorDetail }
    
    let result;
    if(validateIfExists.data[0][0].countCities === 0){
        result = await rest.executeQuery(
            `Insert Into Cities Values 
               ('${ city.trim() }')`
        );
    }
    else
        return { message : "This city already exists" };
    
    if(!result.success)
        return { error : result.errorDetail }
    
    return { message : "You registration has been sucessful" };
}

const RegisterSite = async ({ name, address, idCity }) => {
    const validateIfExists = await rest.executeQuery(
        `Select Count(Id) As countSites From Sites Where Name = '${ name.trim() }'`
    );
    if(!validateIfExists.success)
        return { error : validateIfExists.errorDetail }
    
    let result;
    if(validateIfExists.data[0][0].countSites === 0){
        result = await rest.executeQuery(
            `Insert Into Sites Values 
               ('${ name.trim() }'
               ,'${ address.trim() }'
               ,${ idCity }
               )`
        );
    }
    else
        return { message : "This site already exists" };
    
    if(!result.success)
        return { error : result.errorDetail }
    
    return { message : "You registration has been sucessful" };
}

const GetUsersBySite = async (idSite) => {
    const result = await rest.executeQuery(
        `Select * From Users Where IdSite = '${ idSite }'`
    ); 

    if(!result.success)
        return { error : result.errorDetail }
    
    return result.data;
}

module.exports = {
    rest,
    LogIn,
    RegisterUser,
    RegisterCity,
    RegisterSite,
    GetUsersBySite
}