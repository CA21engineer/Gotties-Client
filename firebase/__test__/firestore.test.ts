import { createEmptyArticle } from './entities/article';
import { firestore } from 'firebase';
const fs = require('fs');
export const firebase = require('@firebase/testing');

export interface Auth {
  uid: string,
  email: string,
}

export const projectID = 'gotties-homehack';
const databaseName = 'gotties-homehack';
export const rules = fs.readFileSync('./firestore.rules', 'utf8');
export const authenticatedApp: (auth: Auth | null) => firestore.Firestore = (auth: Auth | null) => {
  return firebase.initializeTestApp({ projectId: projectID, databaseName, auth }).firestore();
}

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