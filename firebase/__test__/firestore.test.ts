import { createEmptyArticle } from './entities/article';
const firebase = require('@firebase/testing');
const fs = require('fs');

interface Auth {
  uid: string,
  email: string,
}

const projectID = 'gotties-homehack';
const databaseName = 'gotties-homehack';
const rules = fs.readFileSync('./firestore.rules', 'utf8');
const authenticatedApp = (auth: Auth | null) => firebase.initializeTestApp({ projectId: projectID, databaseName, auth }).firestore();

describe('sample test', () => {

  beforeAll(async () => {
    await firebase.loadFirestoreRules({ projectId: projectID, rules })
  });

  beforeEach(async () => {
    await firebase.clearFirestoreData({ projectId: projectID })
  });

  afterAll(async () => {
    await Promise.all(firebase.apps().map((app: any) => app.delete()))
  });

  test('新規データを認証情報なしでは使えない', async () => {
    const db = authenticatedApp(null);
    const article = createEmptyArticle();
    await firebase.assertFails(db.collection('articles').doc('sample-test/test/test').set(article));
  });
});