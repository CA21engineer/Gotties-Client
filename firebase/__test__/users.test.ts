import { firebase, projectID, rules, authenticatedApp, adminApp, Auth } from './firestore_test.util';

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

  test('ログインユーザーは自分の情報が見れる', async () => {
    const admin = adminApp();
    const user = await admin.collection('users').add({});
    const auth: Auth = {
      uid: user.id,
      email: '',
    }
    const db = authenticatedApp(auth);
    firebase.assertSucceeds(db.collection('users').doc(user.id).get());
  });

  test('ログインユーザー以外の情報は見れない', async () => {
    const admin = adminApp();
    const user = await admin.collection('users').add({});
    const user2 = await admin.collection('users').add({});
    const auth: Auth = {
      uid: user.id,
      email: '',
    }
    const db = authenticatedApp(auth);
    firebase.assertFails(db.collection('users').doc(user2.id).get());
  });

  test('ログインしているユーザーなら作成できる', async () => {
    const auth: Auth = {
      uid: 'abc123',
      email: '',
    }
    const db = authenticatedApp(auth);
    firebase.assertSucceeds(db.collection('users').add({}));
  });

  test('ログインしているユーザーでも更新できない', async () => {
    const admin = adminApp();
    const user = await admin.collection('users').add({});
    const auth: Auth = {
      uid: user.id,
      email: '',
    }
    const db = authenticatedApp(auth);
    firebase.assertFails(db.collection('users').doc(user.id).update({}));
  });

  test('ログインしているユーザーなら削除できる', async () => {
    const admin = adminApp();
    const user = await admin.collection('users').add({});
    const auth: Auth = {
      uid: user.id,
      email: '',
    }
    const db = authenticatedApp(auth);
    firebase.assertSucceeds(db.collection('users').doc(user.id).delete());
  });
});