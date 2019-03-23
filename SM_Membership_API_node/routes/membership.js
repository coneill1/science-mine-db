const express = require('express');
const router = express.Router();
const membershipService = require('../data/services/membership.service.js');
const bodyParser = require('body-parser');

const jsonParser = bodyParser.json();

router.route('/', jsonParser)
    .get((req, res) => {
        membershipService.getAll().then(value => {
            res.status(200).send(value);
        })
    });

router.route('/create')
    .post((req, res) => {
        membershipService.createMembership(req.body.type, req.body.active, req.body.start, req.body.end, req.body.primaryMember).then(value => {
            res.status(200).send(value);
        }).catch(err => {
            res.status(500).send(err.message);
        })
    });

module.exports = router;
