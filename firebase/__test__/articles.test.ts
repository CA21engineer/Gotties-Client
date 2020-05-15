import { firebase, projectID, rules, authenticatedApp, Auth, adminApp } from './firestore_test.util';
import Article, { Timestamp } from './entities/article';

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
    firebase.assertSucceeds((await db.collection('articles').get()).docs);
  });

  test('新規データが登録できる', async () => {
    const auth: Auth = {
      uid: 'aaa',
      email: 'aaa@example.com',
    }
    const db = authenticatedApp(auth);
    const category = await db.collection('category').add({
      title: 'category',
      reading: 'かてごりー',
    });
    const article: Article = {
      title: 'title',
      body: 'body',
      before: 'before',
      after: 'after',
      user_id: 'user_id',
      category: category,
      created_at: new Timestamp(0, 0),
      updated_at: new Timestamp(0, 0),
    }
    firebase.assertSucceeds(db.collection('articles').add(article));
  });

  test('カテゴリーがないと登録できない', async () => {
    const admin = adminApp();
    const auth: Auth = {
      uid: 'aaa',
      email: 'aaa@example.com',
    }
    const db = authenticatedApp(auth);
    const category = await admin.collection('category').add({
      title: 'category',
      reading: 'かてごりー'
    });
    await category.delete();
    const article: Article = {
      title: 'title',
      body: 'body',
      before: 'before',
      after: 'after',
      user_id: 'user_id',
      category: category,
      created_at: new Timestamp(0, 0),
      updated_at: new Timestamp(0, 0),
    }
    firebase.assertFails(db.collection('articles').add(article));
  });
});