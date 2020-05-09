import { firebase, projectID, rules } from './firestore.test';

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
});