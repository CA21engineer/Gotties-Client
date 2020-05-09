import { firestore } from 'firebase';

interface Article {
  title: string,
  body: string,
  before: string,
  after: string,
  user_id: string,
  category: string,
  created_at: firestore.Timestamp,
  updated_at: firestore.Timestamp,
}

export const createEmptyArticle: () => Article = () => {
  return {
    title: 'string',
    body: 'string',
    before: 'string',
    after: 'string',
    user_id: 'string',
    category: 'string',
    created_at: new firestore.Timestamp(0, 0),
    updated_at: new firestore.Timestamp(0, 0),
  }
}

export default Article;