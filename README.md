# README
## TACH::FAQの説明
TACH::FAQは受講生の質問の重複をなくすために作るアプリです。
・受講生がエラーを探しやすくなり、すぐ学習を進めやすくなる。
・受講生が自分のアウトプットのためのノートとして使える。
・受講生が自分の学習の進捗をスプレットシートでなくアプリで管理できるようになる。
を目標としています。

## DBの設計
## article関連のDB
### articles table
| Column         | Type           |Options        |
| :------------- | :------------- |:------------- |
| title          | text           |null: false |
| solution       | text           |null: false |
| factor         | text           |null: false |
| knowledge      | text           |null: false |

#### Association
- has_many :codes
- has_many :urls
- has_many :comments
- has_many :tags, through: :article_tags
- has_many :goods, through: :article_goods
- has_many :article_tags
- has_many :article_goods

### codes table
| Column         | Type           |Options        |
| :------------- | :------------- |:------------- |
| code           | text           | |
| article        | references     |foreign_key: true, null: false |

#### Association
- belongs_to :article

### urls table
| Column         | Type           |Options        |
| :------------- | :------------- |:------------- |
| url            | text           | |
| article        | references     |foreign_key: true, null: false |

#### Association
- belongs_to :article

### tags table
| Column         | Type           |Options        |
| :------------- | :------------- |:------------- |
| url            | text           | |
| article        | references     |foreign_key: true, null: false |

#### Association
- has_many :articles, through: :article_tags
- has_many :article_tags 

### comments table
| Column         | Type           |Options        |
| :------------- | :------------- |:------------- |
| text           | text           |null: false |
| article        | references     |foreign_key: true, null: false |

#### Association
- belongs_to :article
- has_many :goods, through: :comment_goods
- has_many :comment_goods

### goods table
| Column         | Type           |Options        |
| :------------- | :------------- |:------------- |
| check          | integer           |null: false |

#### Association
- has_many :comments, through: :comment_goods
- has_many :articles, through: :article_goods
- has_many :comment_goods
- has_many :article_goods

### comment_goods table
| Column         | Type           |Options        |
| :------------- | :------------- |:------------- |
| comment        | references     |null: false, foreign_key: true |
| good           | references     |null: false, foreign_key: true |

#### Association
- belogns_to :good
- belogns_to :comment

### article_goods table
| Column         | Type           |Options        |
| :------------- | :------------- |:------------- |
| article        | references     |null: false, foreign_key: true |
| good           | references     |null: false, foreign_key: true |

#### Association
- belogns_to :good
- belogns_to :article

### article_tags table
| Column         | Type           |Options        |
| :------------- | :------------- |:------------- |
| article        | references     |null: false, foreign_key: true |
| tag            | references     |null: false, foreign_key: true |

#### Association
- belogns_to :tag
- belogns_to :article


## User関連のDB
### users table
| Column         | Type           |Options        |
| :------------- | :------------- |:------------- |
| name           | string         |null: false, unique: true, index: true|

#### Association
- has_many :profiles
- has_many :stages
- has_many :goods
- has_many :progreses, through: :user_progresses

### profiles table
| Column         | Type           |Options        |
| :------------- | :------------- |:------------- |
| icon           | text           ||
| phase          | integer        ||
| style          | integer        ||

#### Association
- belongs_to :user
- has_many :profile_stages
- has_many :stages, through: :prodile_stages

### stages table
| Column         | Type           |Options        |
| :------------- | :------------- |:------------- |
| name           | string         ||

#### Association
- has_many :profile_stages
- has_many :profiles, through: :prodile_stages
- has_many :stage_subjects
- has_many :subjects, through: :stage_subjects
- belongs_to :check

### profile_stages table
| Column         | Type           |Options        |
| :------------- | :------------- |:------------- |
| profile        | references     |null: false, foreign_key: true |
| stage          | references     |null: false, foreign_key: true |

#### Association
- belongs_to :stage
- belongs_to :profile

### subjects table
| Column         | Type           |Options        |
| :------------- | :------------- |:------------- |
| name           | string           |null: false    |

#### Association
- has_many :subject_details
- has_many :stage_subjects
- has_many :subjects, through: :stage_subjects
- belongs_to :check

### stage_subjects table
| Column         | Type           |Options        |
| :------------- | :------------- |:------------- |
| subject        | references     |null: false, foreign_key: true |
| stage          | references     |null: false, foreign_key: true |

#### Association
- belongs_to :stage
- belongs_to :subject

### subject_details table
| Column         | Type           |Options        |
| :------------- | :------------- |:------------- |
| name           | string         |null: false    |
| curriculum_url | text           |null: false, foreign_key: true |

#### Association
- belongs_to :subject
- belongs_to :check

### checks table
| Column         | Type           |Options        |
| :------------- | :------------- |:------------- |
| name           | integer        |null: false    |


#### Association
- belongs_to :stages
- belongs_to :subjects
- belongs_to :subject_detailss


<!-- 以下一旦保留 -->
<!-- ### progress_rates table
| Column         | Type           |Options        |
| :------------- | :------------- |:------------- |
| rate           | integer        |null: false    |
| user           | references     |null: false, foreign_key: true |
| stage          | references     |null: false, foreign_key: true |
| subject        | references     |null: false, foreign_key: true |
| subject_detail | references     |null: false, foreign_key: true |


#### Association
- belongs_to :user
- belongs_to :stage
- belongs_to :subject
- belongs_to :subject_detail -->


