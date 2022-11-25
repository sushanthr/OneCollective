# One Collective

Micro Blogging Social Network

This is a prototype for an open social network, with interesting properties: 
- End to End encryption of all content. Safeguarding users from profiling, selling of user data.
- Explicit data access control.
  At two levels:
    - Data can be classified as accessible to public/ signed in users (prevents crawlers from access)/ groups of users / individual users.
    - All compute on this network happens on the edge device.
- Fully inspectable source code. 
  The entire service/ app will be built using client side code - which makes everything the site/app does auditable. 
- Built using a Backend As A Service.
  Design uses Firebase as a backend, further limiting any secret sauce backend code.
- No new identity or login system. Existing identity providers Apple/Google sign in.

Other Salient features
- Content moderation / Fake News policy
   - ML models will identify unsafe content and prohibit posting unless the user has significant followers. ML flagged items will not leave the follower group, 
     unless significant votes mark the item as safe.
   - Apart from report content buttons. Each content can be ranked for truthfulness. Truthfulness of content will be explicitly surfaced along with likes/dislikes.
   - Content reporting will be community driven. Reported content will be removed through a process that leverages the viewers and asks them if the content is offensive.
- Compliance with local laws
   - Protection from nation state or law enforcement is an explicit non goal. This network should not be a haven for illegal activity. 
   - Though the content is completely encrypted, the system design should allow for
      - law enforcement to remove content. (Easy to do, should not require decryption)
      - Inspect content. (More difficult to achieve since the service does not have decryption keys).
- Ads
  - Ads are going to be a necessary evil to fund a storage service. 
  - However the clients get to pick the ads and run interest topics detection and pull down ads on the client side without any tracking.  
- Fully localized from day one
    - Investigate client side automatic translation ML models of posts to connect every human on the planet.