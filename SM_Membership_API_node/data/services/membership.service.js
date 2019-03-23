const conn = require('../connection.js');

const addMember = (props) => {
    return new Promise(((resolve, reject) => {
        const member = new Member(props);
        conn.query('insert into Member set ?', member, (err, results, fields) => {
            if (err) reject(err);
            resolve(results);
        })
    }));
};

const getAll = () => {
    return new Promise((resolve, reject) => {
        conn.query('select * from Membership', (err, results, fields) => {
            if (err) reject(err);
            console.log(fields);
            resolve(results);
        })
    })
};

const prepValue = (value) => {
    if (value !== undefined && value !== null) {
        if (typeof value === 'number') {
            return value;
        }

        return `'${value}'`;
    } else {
        return value;
    }
};

/**
 * Adds a membership and adds the primary member of the newly created membership
 * @param membershipType
 * @param isActive
 * @param start
 * @param end
 * @param primaryMember
 * @returns {Promise<any>}
 */
const createMembership = (membershipType, isActive, start, end, primaryMember) => {
    return new Promise(((resolve, reject) => {
        let sql = `
            call createMembership(
                ${prepValue(membershipType)},
                ${prepValue(isActive)},
                ${prepValue(start)},
                ${prepValue(end)},
        `;
        Object.values(primaryMember).forEach(value => {
            sql += `${prepValue(value)},`;
        });

        sql = sql.substr(0, sql.length-1);
        sql += ');';
        conn.query(sql, (err, results, fields) => {
            if (err) reject(err);
            resolve(results);
        })
    }))
};

module.exports = {
    addMember: addMember,
    getAll: getAll,
    createMembership: createMembership
};
