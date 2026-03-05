package testimpl

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/launchbynttdata/lcaf-component-terratest/types"
	"github.com/stretchr/testify/assert"
)

func TestComposableBackupPolicyFileShare(t *testing.T, ctx types.TestContext) {

	t.Run("validateBackupPolicyFileShare", func(t *testing.T) {

		policyID := terraform.Output(
			t,
			ctx.TerratestTerraformOptions(),
			"backup_policy_file_share_id",
		)

		assert.NotEmpty(t, policyID)
	})
}
