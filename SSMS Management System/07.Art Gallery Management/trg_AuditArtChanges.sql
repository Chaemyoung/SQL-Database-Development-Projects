-- Trigger for auditing changes
CREATE TRIGGER trg_AuditArtChanges
ON Art
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    INSERT INTO ArtAudit (ArtID, ChangeType, OldValue, NewValue, ChangedBy)
    SELECT i.ArtID, 'UPDATE', d.ArtDetails, i.ArtDetails, SYSTEM_USER
    FROM inserted i
    JOIN deleted d ON i.ArtID = d.ArtID;
END