﻿ALTER TABLE [dbo].[UITemplates]
    ADD CONSTRAINT [FK_UITemplates_Users] FOREIGN KEY ([UserID]) REFERENCES [dbo].[Users] ([ID]) ON DELETE CASCADE ON UPDATE NO ACTION;

