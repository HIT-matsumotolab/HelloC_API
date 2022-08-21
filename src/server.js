import 'dotenv/config';
import express from 'express';
import helmet from 'helmet';
import routes from './routes';
import cors from'cors';
import { expressjwt } from 'express-jwt'
import config from './config/auth'
const app = express();

app.use(helmet());
app.use(express.json({ limit: '50mb' }));
app.use(express.urlencoded({ extended: true, limit: '50mb' }));
// app.use(jwt({
//   secret: config.secret,
//   algorithms: ['HS256'],
//   getToken: req => req.cookies.token 
// }));

app.use(
  expressjwt({
    secret: config.secret,
    algorithms: ["HS256"],
    credentialsRequired: false,
    getToken: function fromHeaderOrQuerystring(req) {
      if (
        req.headers.authorization &&
        req.headers.authorization.split(" ")[0] === "Bearer"
      ) {
        return req.headers.authorization.split(" ")[1];
      } else if (req.query && req.query.token) {
        return req.query.token;
      }
      return null;
    },
  })
);

app.get('/status', (req, res) => {
  res.send('HelloCAPI起動中')
});


app.use(cors(
  {
    origin: 'http://localhost:3001',
    methods: ['GET','POST','DELETE','UPDATE','PUT','PATCH'],
    credentials: true
  }
))//front側とつなげられるように


app.use('/api', routes);

app.listen(4000, () => {
  console.log(`server: http://localhost:4000/`);
});
