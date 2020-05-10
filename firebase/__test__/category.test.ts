import { firebase, projectID, rules, authenticatedApp } from './firestore_test.util';

describe('articles document test', () => {
  beforeAll(async () => {
    await firebase.loadFirestoreRules({ projectId: projectID, rules })
  });

  beforeEach(async () => {
    await firebase.clearFirestoreData({ projectId: projectID })
  });

  afterAll(async () => {
    await Promise.all(firebase.apps().map((app: any) => app.delete()))
  });

  test('認証してないユーザーでもarticleを取得できる', async () => {
    const db = authenticatedApp(null);
    firebase.assertSucceeds((await db.collection('category').get()).docs);
  });
});