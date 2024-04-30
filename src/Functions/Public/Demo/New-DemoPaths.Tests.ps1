InModuleScope Demo {
   BeforeAll {
      Mock -CommandName Get-DemoComputerInfo -MockWith { return 'TestProperty' } 
      Mock -CommandName Test-Path -MockWith { }
      Mock -CommandName New-Item -MockWith { }
   }

   Describe -Tag Unit New-DemoPaths {
      It 'calls the Get-DemoComputerInfo function with the OsName property' {
         $returnValue = New-DemoPaths -Path 1

         Should -Invoke -CommandName Get-DemoComputerInfo -Exactly -Times 1 -ParameterFilter { $Property -eq 'OsName' }
      }

      It 'returns the value retrieved from Get-DemoComputerInfo' {
         $returnValue = New-DemoPaths -Path 1

         $returnValue | Should -Be "TestProperty"
      }

      It 'calls the Test-Path function with the $Path property' {
         New-DemoPaths -Path 1

         Should -Invoke -CommandName Test-Path -Exactly -Times 1 -ParameterFilter { $Path -eq 1 }
      }

      It 'calls the New-Item function if Test-Path results in $false' {
         Mock -CommandName Test-Path -MockWith { return $false }

         New-DemoPaths -Path 1

         Should -Invoke -CommandName New-Item -Exactly -Times 1 -ParameterFilter { $Path -eq 1 }
      }

      It 'does not call the New-Item function if Test-Path results in $true' {
         Mock -CommandName Test-Path -MockWith { return $true }

         New-DemoPaths -Path 1

         Should -Not -Invoke -CommandName New-Item -Exactly -Times 1 -ParameterFilter { $Path -eq 1 }
      }
   }
}
