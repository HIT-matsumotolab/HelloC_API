import 'dotenv/config';
import express from 'express';
import helmet from 'helmet';
import routes from './routes';

//import cors from 'cors';

const app = express();

app.use(helmet());
//app.use(cors);
app.use(express.json({ limit: '50mb' }));
app.use(express.urlencoded({ extended: true, limit: '50mb' }));
app.get('/status', (req, res) => {
  res.send('HelloCAPI起動中')
})


app.use('/', routes);

app.listen(4000, () => {
  console.log(`Example app listening on port 4000!`);
});
