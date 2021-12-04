import 'dotenv/config';
import express from 'express';
import helmet from 'helmet';
import routes from './routes';
import cors from'cors';

const app = express();

app.use(helmet());
app.use(express.json({ limit: '50mb' }));
app.use(express.urlencoded({ extended: true, limit: '50mb' }));
app.get('/status', (req, res) => {
  res.send('HelloCAPI起動中')
})

app.use(cors(
  {methods: ['GET','POST','DELETE','UPDATE','PUT','PATCH']}
))//front側とつなげられるように


app.use('/api', routes);

app.listen(4000, () => {
  console.log(`server: http://localhost:4000/`);
});
