# Roblox Verified Role Titles Script

Verified Role Titles is a Roblox server-side script that displays a blue checkmark and an owner, admin, or tester title above approved players. It uses Roblox UserIds, server-side role verification, BillboardGui, and role priority so only configured owners, admins, and testers receive visible role labels.

## Install

1. Open the experience in Roblox Studio.
2. In Explorer, open `ServerScriptService`.
3. Create a new `Script` named `VerifiedRoleTitles`.
4. Copy the contents of `ServerScriptService/VerifiedRoleTitles.server.lua` into the new Script.
5. Replace the example UserIds in `OWNER_USER_IDS`, `ADMIN_USER_IDS`, and `TESTER_USER_IDS` with the appropriate Roblox UserIds.
6. Publish the experience and test it with an approved account.

The script must run from `ServerScriptService` so role checks are performed on the server.

## Use

1. Add an owner UserId to `OWNER_USER_IDS`, an admin UserId to `ADMIN_USER_IDS`, or a tester UserId to `TESTER_USER_IDS`.
2. Start or play-test the experience.
3. Approved players receive a BillboardGui above their character's head.
4. The label shows a blue checkmark and the corresponding `OWNER`, `ADMIN`, or `TESTER` title.
5. Players not included in any role list receive no title or checkmark.
6. If a UserId appears in multiple lists, the selected priority is Owner, then Admin, then Tester.

Example configuration:

```lua
local OWNER_USER_IDS = {
    [123456789] = true,
}

local ADMIN_USER_IDS = {
    [234567890] = true,
}

local TESTER_USER_IDS = {
    [345678901] = true,
}
```

---

More Roblox script projects by EnderDevelopment: https://github.com/EnderDevelopment

Project page: https://dash.enderdevelopment.com/community/446a1ab8-a835-4f2f-9b70-dbacf6d1200f?utm_source=github&utm_medium=readme&utm_campaign=auto_publish&utm_content=446a1ab8-a835-4f2f-9b70-dbacf6d1200f
