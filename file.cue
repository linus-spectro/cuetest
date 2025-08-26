package example

namespace: {
	type:        "component"
	description: "A test component for testing the registry"
	labels: {
		"componentdefinition.mural.sh/type": "application"
	}
}

template: #ManagedBy & {
	output: {
		apiVersion: "v1"
		kind:       "Namespace"
		metadata: {
			labels: {
				if parameter.labels != _|_ {
					parameter.labels
				}
				"wl.mural.sh/name":      context.workloadName
				"wl.mural.sh/component": context.name
				"foo":                   "bar"
			}
			if parameter.annotations != _|_ {
				annotations: parameter.annotations
			}
		}
	}

	parameter: {
		// +usage=Annotations for the namespace
		annotations?: [string]: string

		// +usage=Labels for the namespace
		labels?: [string]: string
	}
}

context: {
	workloadName: "foo"
	name:         "fredrik"
}
