
    export interface IRegister {
        id: string;
        date: string;
        status: string;
        userID: string;
        reason: string;
        createdate: string;
    }

    export interface ISaintDetails {
        id: string;
        title: string;
        name: string;
        surname: string;
        email: string;
        cell: string;
        address: string;
        acuptation: string;
        dateJoined: string;
        status: string;
        agegroup: string;
        meritalStatus: string;
        registerLS: IRegister[];
    }



    
    