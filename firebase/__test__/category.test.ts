import { firebase, projectID, rules, authenticatedApp, Auth, adminApp } from './firestore_test.util';

describe('category document test', () => {
  beforeAll(async () => {
    await firebase.loadFirestoreRules({ projectId: projectID, rules })
  });

  beforeEach(async () => {
    await firebase.clearFirestoreData({ projectId: projectID })
  });

  afterAll(async () => {
    await Promise.all(firebase.apps().map((app: any) => app.delete()))
  });

  it('認証してないユーザーでもcategoryを取得できる', async () => {
    const db = authenticatedApp(null);
    await firebase.assertSucceeds((await db.collection('category').get()).docs);
  });

  it('認証ユーザーでかつタイトルがあれば登録できる', async () => {
    const auth: Auth = {
      uid: 'abc123',
      email: '',
    }
    const db = authenticatedApp(auth);
    await firebase.assertSucceeds(db.collection('category').add({
      title: 'title',
    }));
  });

  it('タイトルがないと登録できない', async () => {
    const auth: Auth = {
      uid: 'abc123',
      email: '',
    }
    const db = authenticatedApp(auth);
    await firebase.assertFails(db.collection('category').add({}));
  });

  it('認証ユーザーでない場合登録できない', async () => {
    const db = authenticatedApp(null);
    await firebase.assertFails(db.collection('category').add({}));
  });
  
  it('認証ユーザーでかつタイトルがあれば更新できる', async () => {
    const admin = adminApp();
    const auth: Auth = {
      uid: 'abc123',
      email: '',
    }
    const category = await admin.collection('category').add({
      title: 'title',
      reading: 're',
    });
    const db = authenticatedApp(auth);
    await firebase.assertSucceeds(db.collection('category').doc(category.id).update({
      title: 'title_updated',
    }));
  });

  it('認証ユーザーでない場合更新できない', async () => {
    const admin = adminApp();
    const category = await admin.collection('category').add({
      title: 'title',
    });
    const db = authenticatedApp(null);
    await firebase.assertFails(db.collection('category').doc(category.id).update({
      title: 'title_updated',
      reading: 'reading',
    }));
  });

  it('タイトルがないと更新できない', async () => {
    const admin = adminApp();
    const auth: Auth = {
      uid: 'abc123',
      email: '',
    }
    const category = await admin.collection('category').add({
      title: 'title',
    });
    const db = authenticatedApp(auth);
    await firebase.assertFails(db.collection('category').doc(category.id).update({
      reading: 'reading',
    }));
  });

  it('削除できない', async () => {
    const admin = adminApp();
    const auth: Auth = {
      uid: 'abc123',
      email: '',
    }
    const category = await admin.collection('category').add({
      title: 'title',
    });
    const db = authenticatedApp(auth);
    await firebase.assertFails(db.collection('category').doc(category.id).delete());
  });
});