package testimpl

import (
	"context"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/launchbynttdata/lcaf-component-terratest/types"
	"github.com/stretchr/testify/assert"
)

func TestComposableBackupPolicyFileShare(t *testing.T, ctx types.TestContext) {
	validateBackupPolicyFileShare(t, ctx)
}

func TestComposableReadonlyBackupPolicyFileShare(t *testing.T, ctx types.TestContext) {
	validateBackupPolicyFileShare(t, ctx)
}

func validateBackupPolicyFileShare(t *testing.T, ctx types.TestContext) {

	t.Run("validateBackupPolicyFileShareExists", func(t *testing.T) {

		policyID := terraform.OutputContext(t, context.Background(), ctx.TerratestTerraformOptions(),
			"backup_policy_file_share_id",
		)

		assert.NotEmpty(t, policyID)
	})
}
